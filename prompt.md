I have a Flutter app for a sandwich shop. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with the home screen as `OrderScreen(maxQuantity: 5)`. The app has two main screens: an order screen (`lib/views/order_screen.dart`) where users select sandwiches and add them to their cart, and a cart screen (`lib/views/cart_screen.dart`) where users view their cart items and total price.

The app uses a Cart model (likely in `lib/models/cart.dart`) with methods like `addItem`, `removeItem`, and `updateQuantity`, and CartItem objects with properties like sandwich name, quantity, and price. The OrderScreen allows adding items to the cart, and navigation to the CartScreen.

I need to implement a feature allowing users to modify items in their cart on the cart screen. Specifically:

1. **Change Quantity**: On the cart screen, for each cart item, display the current quantity and include buttons (e.g., + and - icons) next to it. When the user taps the + button, increase the quantity by 1, update the Cart model, recalculate the total price, and refresh the UI. When the user taps the - button, decrease the quantity by 1; if the quantity reaches 0 or below, remove the item entirely from the cart, update the model, and refresh the UI. Ensure the total price updates in real-time.

2. **Remove Item**: On the cart screen, include a remove button (e.g., trash icon) for each cart item. When tapped, remove the item from the cart, update the Cart model, recalculate the total price, and refresh the UI. If the cart becomes empty after removal, display a message like "Your cart is empty" and perhaps a button to navigate back to the order screen.

Additional requirements:
- Use Flutter widgets like ListView.builder for displaying cart items.
- Ensure the cart screen has a way to navigate back to the order screen (e.g., via AppBar back button or a custom button).
- Handle edge cases: Prevent quantities from going negative, ensure UI updates immediately after actions, and manage empty cart states gracefully.
- The Cart model should persist changes (e.g., using a state management solution like Provider or setState in the screen).
- Integrate seamlessly with existing navigation; for example, after modifications, users can continue shopping or proceed to checkout (if implemented).

Provide the updated code for `lib/views/cart_screen.dart`, any necessary changes to the Cart model in `lib/models/cart.dart`, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/views/cart_screen_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.