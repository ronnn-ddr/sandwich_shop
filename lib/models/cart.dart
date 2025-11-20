import 'sandwich.dart';

class Cart {
  final Map<Sandwich, int> items = {};

  void addItem(Sandwich sandwich, {int quantity = 1}) {
    items[sandwich] = (items[sandwich] ?? 0) + quantity;
  }

  void removeItem(Sandwich sandwich) {
    items.remove(sandwich);
  }

  void updateQuantity(Sandwich sandwich, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(sandwich);
    } else {
      items[sandwich] = newQuantity;
    }
  }

  double get totalPrice =>
      items.entries.fold(0.0, (sum, entry) => sum + (entry.key.price * entry.value));

  void clear() {
    items.clear();
  }

  int get itemCount => items.length;

  int get totalQuantity => items.values.fold(0, (sum, qty) => sum + qty);

  int get countOfItems => itemCount;
}
