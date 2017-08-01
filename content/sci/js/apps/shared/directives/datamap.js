(function ($) {

	angular.module('xom.shared').directive('datamap', function () {

		'use strict';

		return {
			restrict: 'E',
			replace: true,
			scope: {
				currentRegion: '=',
				height: '@',
				onClick: '&',
				options: '=',
				supportedRegions: '='
			},
			template: '<div class="datamap"></div>',
			link: function (scope, element) {

				var lastRegion = scope.currentRegion;

				var defaultOptions = {
					data: {},
					done: function (datamap) {
						datamap.svg.selectAll('.datamaps-subunit')
							.on('click', onRegionClick)
							.on('mouseenter', onRegionIn)
							.on('mouseleave', onRegionOut);
					},
					element: element[0],
					height: scope.height,
					projection: 'mercator',
					responsive: true,
					geographyConfig: {
						popupOnHover: false/*,
						popupTemplate: function (geography, data) {
							if (!isSupported(geography.id)) return;
							return '<div class="hoverinfo">' + geography.properties.name + '</div>';
						}*/
					}
				};

				var choropleth = {};

				if (scope.currentRegion) {
					setActive(scope.currentRegion, true);
				}

				// Need to use jQuery.extend here because angular.merge isn't available in 1.2.9
				var options = $.extend(true, {}, defaultOptions, scope.options);

				var map = new Datamap(options);
				
				var labels = { 'HKG': 'Hong Kong' };
				map.labels({ 'customLabelText': labels });

				if (options.backgroundColor) {
					element.find('.datamap').css('background-color', options.backgroundColor);
				}

				var unregister = scope.$watch('supportedRegions', function (v) {
					if (!v || !v.length) return;
					//var labels = { customLabelText: {} };
					for (var i = 0; i < v.length; i++) {
						var code = v[i].code;
						var name = v[i].name;
						//labels.customLabelText[code] = name;
						if (choropleth[code] && choropleth[code].fillKey == 'active') continue;
						choropleth[code] = { fillKey: 'supported' };
					}
					//map.labels(labels);
					map.updateChoropleth(choropleth);
					unregister();
				});

				scope.$watch('currentRegion', function (v) {
					if (!v || lastRegion == v) return;
					setActive(lastRegion, false, true);
					setActive(v, true);
					lastRegion = v;
				});

				$(window).on('resize', function () {
					map.resize();
				});

				function isSupported(id) {
					return scope.supportedRegions.filter(function (r) { return r.code == id; }).length > 0;
				}

				function setActive(id, active, noUpdate) {
					choropleth[id] = { fillKey: active ? 'active' : 'supported' };
					if (!noUpdate && map) map.updateChoropleth(choropleth);
				}

				function onRegionClick(geography) {
					if (!isSupported(geography.id)) return;

					scope.currentRegion = geography.id;
					scope.$apply();

					if (!angular.isFunction(scope.onClick)) return;
					scope.onClick({ geography: geography });
				}

				function onRegionIn(geography) {
					if (!isSupported(geography.id)) return;
					setActive(geography.id, true);
				}

				function onRegionOut(geography) {
					if (!isSupported(geography.id) || geography.id == lastRegion) return;
					setActive(geography.id, false);
				}
			}
		};

	});

}(window.jQuery));