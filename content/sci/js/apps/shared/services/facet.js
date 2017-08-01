	angular.module('xom.shared').factory('facetSvc', ['serializationSvc', function (serializationSvc) {

		'use strict';

		function isFacetValueSelected(facets, facetKey, valueKey) {
			var facet = getByKey(facets, facetKey);
			if (facet === null) return;

			var value = getByKey(facet.values, valueKey);
			return (value && value.selected === true);
		}

		function toggleFacetValue(facets, facetKey, valueKey) {
			var facet = getByKey(facets, facetKey);
			if (facet === null) return;

			var value = getByKey(facet.values, valueKey);
			if (value === null) return;

			value.selected = !value.selected;
		}

		function mergeFacets(dest, src) {
			for (var i = 0; i < dest.length; i++) {
				var facet = getByKey(src, dest[i].key);
				if (facet === null) continue;
				for (var v = 0; v < dest[i].values.length; v++) {
					var value = getByKey(facet.values, dest[i].values[v].key);
					if (value === null) continue;
					dest[i].values[v].selected = value.selected;
				}
			}
			return dest;
		}

		// Serializes the facet selection in a format the API expects
		// e.g. "Facet1:ValueA,ValueB|Facet2:ValueC,ValueD"
		function serializeFacets(facets) {
			var s = [];
			for (var i = 0; i < facets.length; i++) {
				var facet = facets[i];
				var selectedValues = (facet.values || []).filter(isValueSelected);
				if (selectedValues.length === 0) continue;
				s.push(facet.key + ':' + selectedValues.map(getValueKey).join(','));
			}
			return s.join('|');
		}

		// serializedFacetValues = "Facet1:ValueA,ValueB|Facet2:ValueC,ValueD"
		// facetState = {
		//    "Facet1": ["ValueA", "ValueB"],
		//    "Facet2": ["ValueC", "ValueD"]
		// }
		function applyFacetSelections(facets, serializedFacetValues) {
			if (!serializedFacetValues) return;
			var facetState = deserializeSelectedFacets(serializedFacetValues);
			for (var i = 0; i < facets.length; i++) {
				var facet = facets[i];
				var facetSelections = getFacetSelections(facetState, facet.key);
				if (facetSelections === null || facetSelections.length === 0) continue;
				for (var v = 0; v < facet.values.length; v++) {
					var value = facet.values[v];
					value.selected = arrayContainsString(facetSelections, value.key);
				}
			}
		}

		function isValueSelected(value) {
			return value.selected === true;
		}

		function getByKey(array, key) {
			var keyLower = key.toLowerCase();
			var matches = array.filter(function (e) {
				return e.key.toLowerCase() === keyLower;
			});
			return matches.length > 0 ? matches[0] : null;
		}

		function getFacetSelections(facetState, key) {
			var keyLower = key.toLowerCase();
			for (var p in facetState) {
				if (p.toLowerCase() === keyLower) return facetState[p];
			}
			return null;
		}

		function getValueKey(value) {
			return value.key;
		}

		function deserializeSelectedFacets(s) {
			var selections = serializationSvc.deserialize(s, '|', ':');
			for (var p in selections) {
				if (selections[p] === null) continue;
				selections[p] = selections[p].split(',');
			}
			return selections;
		}

		function arrayContainsString(array, str) {
			var strLower = str.toLowerCase();
			return array.filter(function (e) { return e.toLowerCase() === strLower; }).length > 0;
		}

		return {
			applyFacetSelections: applyFacetSelections,
			isFacetValueSelected: isFacetValueSelected,
			mergeFacets: mergeFacets,
			serializeFacets: serializeFacets,
			toggleFacetValue: toggleFacetValue
		};
	}
]);
