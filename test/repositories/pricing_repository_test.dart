import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('getSandwichPrice returns correct price for footlong', () {
      int price = PricingRepository().getSandwichPrice(true);
      expect(price, 11);
    });

    test('getSandwichPrice returns correct price for six-inch', () {
      int price = PricingRepository().getSandwichPrice(false);
      expect(price, 7);
    });

    test('initial price should be 0', () {
      final repository = PricingRepository();
      expect(repository.basePrice, 0);
    });
  });
}
