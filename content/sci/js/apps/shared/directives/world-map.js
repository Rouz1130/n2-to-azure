(function ($, d3) {

	angular.module('xom.shared').directive('worldMap', ['$compile', '$timeout', 'REGIONS', 'ZOOM', function ($compile, $timeout, REGIONS, ZOOM) {

		var ASPECT_HEIGHT = 500;
		var ASPECT_WIDTH = 938;
		var ZOOM_DURATION = 750;
		var MAP_SCALE = 150;
		var DEFAULT_ZOOM = { window: 0.8, max: 4 };
		var LABEL_OFFSET_X = 5;
		var LABEL_OFFSET_Y = 5;

		return {
			restrict: 'E',
			replace: true,
			scope: {
				config: '='
			},
			template: '<div class="world-map-container world-map-regions" ng-click="onContainerClick()">' +
				'<div class="world-map"><div class="world-map-label"></div><div class="world-map-popover-target"></div><div class="world-map-popover-content hidden"></div></div></div>',
			link: function (scope, element) {

				var supportedCountries = getSupportedCountries();
				var topography;
				var $map = $(element.find('.world-map'));
				var $label = $map.find('.world-map-label');
				var $popoverBody = $map.find('.world-map-popover-content');
				var $popoverTarget = $map.find('.world-map-popover-target');
				var initialWidth = getMapWidth();

				var projection = d3.geo.mercator()
					.scale(MAP_SCALE)
					.translate([ASPECT_WIDTH / 2, ASPECT_HEIGHT / 1.5]);

				var path = d3.geo.path()
					.projection(projection);

				var svg = d3.select($map[0]).append('svg')
					.attr('preserveAspectRatio', 'xMidYMid')
					.attr('viewBox', '0 0 ' + ASPECT_WIDTH + ' ' + ASPECT_HEIGHT)
					.attr('width', initialWidth)
					.attr('height', initialWidth * ASPECT_HEIGHT / ASPECT_WIDTH);

				svg.append('rect')
					.attr('class', 'water')
					.attr('width', ASPECT_WIDTH)
					.attr('height', ASPECT_HEIGHT)
					.on('click', onContainerClick);

				var g = svg.append('g');

				scope.onContainerClick = onContainerClick;

				d3.json(scope.config.topoUrl, function (error, topo) {
					if (error) throw error;
					topography = topo;
					createRegionZooms();
					createRegions();
				});

				$(window).resize(resize);

				function createRegions() {
					var regions = mergeCountriesIntoRegions(false);
					g.append('g')
						.attr('class', 'regions')
						.selectAll('path')
						.data(regions)
						.enter()
						.append('path')
						.attr('class', getRegionCssClass)
						.attr('data-name', getRegionName)
						.attr('d', path)
						.on('click', onRegionClick);
				}

				function createRegionZooms() {
					var regions = mergeCountriesIntoRegions(true);
					g.append('g')
						.attr('class', 'regions-zoom')
						.selectAll('path')
						.data(regions)
						.enter()
						.append('path')
						.attr('data-name', getRegionName)
						.attr('d', path);
				}

				function mergeCountriesIntoRegions(supportedOnly) {
					var regions = [];
					for (var i = 0; i < REGIONS.length; i++) {
						var thisRegionFilter = createRegionFilter(REGIONS[i], supportedOnly);
						var data = topojson.merge(topography, topography.objects.countries.geometries.filter(thisRegionFilter));
						data.region = REGIONS[i];
						regions.push(data);
					}
					return regions;
				}

				function createCountries(region) {
					var isInRegion = function (d) {
						return region.include.indexOf(d.id) > -1;
					};

					var countryTopo = $.extend(true, {}, topography);
					countryTopo.objects.countries.geometries = countryTopo.objects.countries.geometries.filter(isInRegion);
					var countryData = topojson.feature(countryTopo, countryTopo.objects.countries).features;

					g.append('g')
						.attr('class', 'countries')
						.selectAll('path')
						.data(countryData)
						.enter()
						.append('path')
						.attr('d', path)
						.attr('class', getCountryCssClass)
						.attr('code', getCountryCode)
						.on('mouseenter', onCountryEnter)
						.on('mousemove', onCountryOver)
						.on('mouseleave', onCountryExit)
						.on('click', onCountryClick);
				}

				function getBBox(selection) {
					selection.each(function (d) { d.bbox = this.getBBox(); });
				}

				function clearCountries() {
					svg.selectAll('.countries,.country-labels').remove();
				}

				function clearPopups() {
					// hack: the popover would retain the previous country's info without this
					$('body > .popover').remove();
					$popoverTarget.popover('destroy');
				}

				function showCountryPopup(d, left, top) {
					$popoverTarget.data('bs.popover', null);
					$popoverTarget.css({ left: left, top: top });
					$popoverTarget.popover({
						container: 'body',
						content: getCountryPopupContent(d),
						html: 'true',
						trigger: 'manual',
						'white-space': 'nowrap'
					});
					$popoverTarget.popover('show');
				}

				function resize() {
					var w = getMapWidth();
					svg.attr('width', w).attr('height', w * ASPECT_HEIGHT / ASPECT_WIDTH);
					clearPopups();
				}

				function createRegionFilter(region, supportedOnly) {
					return function (d) {
						return region.include.indexOf(d.id) > -1 && (!supportedOnly || supportedCountries[d.id]);
					};
				}

				function getMapWidth() {
					return Math.min(parseInt(scope.config.maxWidth || 1600), $map.width());
				}

				function getRegionCssClass(d) {
					return 'region ' + (d.region.countries.length ? 'supported' : 'unsupported');
				}

				function getRegionName(d) {
					return d.region.name;
				}

				function getCountryCssClass(d) {
					return 'country ' + (isSupportedCountry(d.id) ? 'supported' : 'unsupported');
				}

				function getCountryCode(d) {
					return d.id;
				}

				function getCountryName(d) {
					var country = supportedCountries[d.id];
					return country ? country.name : null;
				}

				function getCountryPopupContent(d) {
					var country = supportedCountries[d.id];
					if (!country) return null;

					var popupScope = scope.$new(true);
					angular.extend(popupScope, country);
					var html = '<div class="world-map-popover">' + scope.config.popupTemplate + '</div>';
					var elem = $compile(html)(popupScope);
					$popoverBody.empty().append(elem);
					popupScope.$apply();
					return $popoverBody.html();
				}

				function isSupportedCountry(id) {
					return Object.keys(supportedCountries).indexOf(id) > -1;
				}

				function getXYZ(d) {
					var zoom = ZOOM || DEFAULT_ZOOM;
					var bounds = path.bounds(d);
					var widthScale = (bounds[1][0] - bounds[0][0]) / ASPECT_WIDTH;
					var heightScale = (bounds[1][1] - bounds[0][1]) / ASPECT_HEIGHT;
					var z = Math.min(zoom.max, zoom.window / Math.max(widthScale, heightScale));
					var x = (bounds[1][0] + bounds[0][0]) / 2;
					var y = (bounds[1][1] + bounds[0][1]) / 2 + (ASPECT_HEIGHT / z / 6);
					return [x, y, z];
				}

				function zoomIn(d) {
					var xyz = getXYZ(d);
					zoom(xyz, d);
				}

				function zoomOut() {
					var xyz = [ASPECT_WIDTH / 2, ASPECT_HEIGHT / 1.5, 1];
					zoom(xyz);
				}

				function zoom(xyz, d) {
					var countryMode = (d !== undefined);

					g.transition()
						.duration(ZOOM_DURATION)
						.attr('transform', 'translate(' + projection.translate() + ')scale(' + xyz[2] + ')translate(-' + xyz[0] + ',-' + xyz[1] + ')')
						.selectAll(['.countries'])
						.style('stroke-width', 1.0 / xyz[2] + 'px');

					if (countryMode) {
						$timeout(function () {
							$map.addClass('country-mode');
						}, ZOOM_DURATION);
					} else {
						$map.removeClass('country-mode');
					}
				}

				function toggleActive(d) {
					clearPopups();

					if (d && d !== scope.config.activeItem && (d.region || isSupportedCountry(d.id))) {
						scope.config.activeItem = d;
					} else {
						scope.config.activeItem = null;
						clearCountries();
						zoomOut();
					}

					g.selectAll('path, .country-labels g').classed('active', isSelected);

					return (scope.config.activeItem === d);
				}

				function onContainerClick() {
					toggleActive();
				}

				function onRegionClick(d) {
					d3.event.stopPropagation();
					setRegion(d);
				}

				function setRegion(d) {
					if (!toggleActive(d)) return;
					createCountries(d.region);
					var zoom = d3.select('.regions-zoom [data-name="' + d.region.name + '"]').datum();
					zoomIn(zoom);
				}

				function isSelected(d) {
					return scope.config.activeItem && d.id && d.id === scope.config.activeItem.id;
				}

				function isCountryInRegion(region, d) {
					return region.include.indexOf(d.id) > -1;
				}

				function onCountryEnter(d) {
					if (scope.config.activeItem === d) return;
					var countryName = getCountryName(d);
					$label.text(countryName).addClass('active');
					$label.data('height', $label.outerHeight());
					$label.data('width', $label.outerWidth());
				}

				function onCountryOver(d) {
					var left = d3.event.layerX - $label.data('width') - LABEL_OFFSET_X;
					var top = d3.event.layerY - $label.data('height') - LABEL_OFFSET_Y;
					$label.css({ left: left, top: top });
				}

				function onCountryClick(d) {
					d3.event.stopPropagation();
					if (!toggleActive(d)) return;

					var left = d3.event.layerX - ($popoverTarget.width() / 2);
					var top = d3.event.layerY - ($popoverTarget.width() / 2);
					showCountryPopup(d, left, top);
				}

				function onCountryExit(d) {
					$label.removeClass('active');
				}

				function notifyOnClick(fn, d) {
					if (!angular.isFunction(fn)) return;
					fn(d);
				}

				function getSupportedCountries() {
					var countries = {};
					for (var i = 0; i < REGIONS.length; i++) {
						for (var j = 0; j < REGIONS[i].countries.length; j++) {
							var country = REGIONS[i].countries[j];
							countries[country.code] = country;
						}
					}
					return countries;
				}
			}
		};
	}]);

}(window.jQuery, window.d3));