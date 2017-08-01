describe('Facet Service Test', function () {

	'use strict';

	beforeEach(module('xom.shared'));

	it('should toggle facet selection correctly', inject(function (facetSvc) {

		var facets = createFacets();

		expect(facetSvc.isFacetValueSelected(facets, 'LOB', 'IND')).toEqual(true);
		expect(facetSvc.isFacetValueSelected(facets, 'LOB', 'RET')).toEqual(true);
		expect(facetSvc.isFacetValueSelected(facets, 'PROD', 'X')).toEqual(true);
		expect(facetSvc.isFacetValueSelected(facets, 'PROD', 'Y')).toEqual(true);

		facetSvc.toggleFacetValue(facets, 'LOB', 'RET');
		facetSvc.toggleFacetValue(facets, 'PROD', 'X');

		expect(facetSvc.isFacetValueSelected(facets, 'LOB', 'IND')).toEqual(true);
		expect(facetSvc.isFacetValueSelected(facets, 'LOB', 'RET')).toEqual(false);
		expect(facetSvc.isFacetValueSelected(facets, 'PROD', 'X')).toEqual(false);
		expect(facetSvc.isFacetValueSelected(facets, 'PROD', 'Y')).toEqual(true);
	}));

	it('should serialize correctly', inject(function (facetSvc) {

		var facets = createFacets();
		facets[1].values[0].selected = false;

		var expected = 'LOB:IND,RET|PROD:Y';

		var serialized = facetSvc.serializeFacets(facets);
		expect(serialized).toEqual(expected);
	}));

	it('should apply correctly', inject(function (facetSvc) {

		var facets = createFacets();
		var serializedFacetValues = 'LOB:IND,RET|PROD:Y';

		facetSvc.applyFacetSelections(facets, serializedFacetValues);
		expect(facets[0].values[0].selected).toEqual(true);
		expect(facets[0].values[1].selected).toEqual(true);
		expect(facets[1].values[0].selected).toEqual(false);
		expect(facets[1].values[1].selected).toEqual(true);
	}));

	function createFacets() {
		var facets = [];
		addFacet(facets, 'LOB', 'Line of Business', 'IND|Industrial', 'RET|Retail');
		addFacet(facets, 'PROD', 'Product', 'X|Test X', 'Y|Test Y');
		return facets;
	}

	function addFacet(facets, key, name) {
		var facet = {
			key: key,
			name: name,
			values: []
		};
		for (var i = 3; i < arguments.length; i++) {
			var parts = arguments[i].split('|');
			facet.values.push({
				key: parts[0],
				name: parts[1],
				selected: true
			});
		}
		facets.push(facet);
	}
});