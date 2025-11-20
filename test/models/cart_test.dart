import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    late Cart cart;
    late Sandwich sandwich1;
    late Sandwich sandwich2;

    setUp(() {
      cart = Cart();
      sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
    });

    test('initial cart is empty', () {
      expect(cart.items, isEmpty);
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0.0);
    });

    test('addItem adds new item to cart', () {
      cart.addItem(sandwich1);

      expect(cart.items.length, 1);
      expect(cart.items.containsKey(sandwich1), true);
      expect(cart.items[sandwich1], 1);
      expect(cart.itemCount, 1);
      expect(cart.totalPrice, 7.0);
    });

    test('addItem adds multiple quantities', () {
      cart.addItem(sandwich1, quantity: 3);

      expect(cart.items[sandwich1], 3);
      expect(cart.totalPrice, 21.0);
    });

    test('addItem combines quantities for identical sandwiches', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich1, quantity: 2);

      expect(cart.items.length, 1);
      expect(cart.items[sandwich1], 3);
      expect(cart.totalPrice, 21.0);
    });

    test('addItem does not combine different sandwiches', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich2);

      expect(cart.items.length, 2);
      expect(cart.itemCount, 2);
      expect(cart.totalPrice, 7.0 + 11.0); // 18.0
    });

    test('removeItem removes the item from cart', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich2);

      cart.removeItem(sandwich1);

      expect(cart.items.containsKey(sandwich1), false);
      expect(cart.items.length, 1);
      expect(cart.itemCount, 1);
      expect(cart.totalPrice, 11.0);
    });

    test('updateQuantity increases quantity', () {
      cart.addItem(sandwich1);

      cart.updateQuantity(sandwich1, 5);

      expect(cart.items[sandwich1], 5);
      expect(cart.totalPrice, 35.0);
    });

    test('updateQuantity decreases quantity', () {
      cart.addItem(sandwich1, quantity: 3);

      cart.updateQuantity(sandwich1, 1);

      expect(cart.items[sandwich1], 1);
      expect(cart.totalPrice, 7.0);
    });

    test('updateQuantity removes item when quantity is zero', () {
      cart.addItem(sandwich1);

      cart.updateQuantity(sandwich1, 0);

      expect(cart.items, isEmpty);
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0.0);
    });

    test('updateQuantity removes item when quantity is negative', () {
      cart.addItem(sandwich1);

      cart.updateQuantity(sandwich1, -1);

      expect(cart.items, isEmpty);
    });

    test('clear empties the cart', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich2);

      cart.clear();

      expect(cart.items, isEmpty);
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0.0);
    });

    test('totalPrice calculates correctly with multiple items', () {
      cart.addItem(sandwich1, quantity: 2); // 14.0
      cart.addItem(sandwich2); // 11.0

      expect(cart.totalPrice, 25.0);
    });
  });
}
