describe('Extender Service Tests', function () {

	'use strict';

	beforeEach(module('xom.shared'));

	it('should perform a case-insensitive search', inject(function (extenderSvc) {
		var obj = { someProperty: 0 };
		var variations = ['someProperty', 'SomeProperty', 'SOMEPROPERTY'];
		for (var i = 0; i < variations.length; i++) {
			expect(extenderSvc.getPropertyName(obj, variations[i])).toBe('someProperty');
		}
	}));

	it('should copy properties correctly', inject(function (extenderSvc) {
		var src = { a: 1, b: 2, c: 3 };
		var dst = { a: 7, B: 8, z: 9 };
		extenderSvc.copyProperties(src, dst);
		expect(src.a).toBe(1);
		expect(src.b).toBe(2);
		expect(src.c).toBe(3);
		expect(dst.a).toBe(1);
		expect(dst.B).toBe(2);
		expect(dst.b).toBeUndefined();
		expect(dst.c).toBe(3);
		expect(dst.z).toBe(9);
	}));

	it('should extend case-insensitive properties', inject(function (extenderSvc) {
		var src1 = { a: 1, b: 2, c: 3 };
		var src2 = { a: 7, B: 8, z: 9 };
		var obj = extenderSvc.extend({}, src1, src2);
		var propertyCount = 0; for (var p in obj) { propertyCount++; };
		expect(obj.a).toBe(7);
		expect(obj.b).toBe(8);
		expect(obj.c).toBe(3);
		expect(obj.B).toBeUndefined();
		expect(obj.c).toBe(3);
		expect(obj.z).toBe(9);
		expect(propertyCount).toBe(4);
	}));

});