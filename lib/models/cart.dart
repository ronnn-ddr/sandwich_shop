import 'sandwich.dart';

class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem(this.sandwich, this.quantity);

  double get totalPrice => sandwich.price * quantity;
}

class Cart {
  final List<CartItem> items = [];

  void addItem(Sandwich sandwich, {int quantity = 1}) {
    CartItem? existingItem;
    for (var item in items) {
      if (item.sandwich == sandwich) {
        existingItem = item;
        break;
      }
    }
    if (existingItem != null) {
      existingItem.quantity += quantity;
    } else {
      items.add(CartItem(sandwich, quantity));
    }
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  void updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(item);
    } else {
      item.quantity = newQuantity;
    }
  }

  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void clear() {
    items.clear();
  }

  int get itemCount => items.length;

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
}
