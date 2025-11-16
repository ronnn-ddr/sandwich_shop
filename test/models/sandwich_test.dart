import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('constructor creates sandwich with correct properties', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, true);
      expect(sandwich.breadType, BreadType.white);
    });

    test('name getter returns correct name for veggieDelight', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      expect(sandwich.name, 'Veggie Delight');
    });

    test('name getter returns correct name for chickenTeriyaki', () {
      final sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      expect(sandwich.name, 'Chicken Teriyaki');
    });

    test('name getter returns correct name for tunaMelt', () {
      final sandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      expect(sandwich.name, 'Tuna Melt');
    });

    test('name getter returns correct name for meatballMarinara', () {
      final sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      expect(sandwich.name, 'Meatball Marinara');
    });

    test('image getter returns correct path for six inch sandwich', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );

      expect(sandwich.image, 'assets/images/veggieDelight_six_inch.png');
    });

    test('image getter returns correct path for footlong sandwich', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('image getter for different types', () {
      final chickenSandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );

      expect(
          chickenSandwich.image, 'assets/images/chickenTeriyaki_six_inch.png');

      final tunaSandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.wheat,
      );

      expect(tunaSandwich.image, 'assets/images/tunaMelt_footlong.png');

      final meatballSandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );

      expect(meatballSandwich.image,
          'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
