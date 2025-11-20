# Cart Item Modification Feature

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

# Login Screen Feature

I have a Flutter app for a sandwich shop. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with the home screen as `OrderScreen(maxQuantity: 5)`. The app has screens like order screen (`lib/views/order_screen.dart`), cart screen (`lib/views/cart_screen.dart`), and checkout screen (`lib/views/checkout_screen.dart`). The app uses a Cart model in `lib/models/cart.dart`.

I need to implement a login screen where users can enter and view their details. This screen should allow users to switch between sign-up and sign-in modes. For sign-up, users can enter their name, email, and password. For sign-in, users enter email and password. After entering details, users can view their entered information on the same screen. No authentication or data persistence is required yet; just form handling and display.

Key requirements:
1. **Sign Up Mode**: Display form fields for name (TextFormField), email (TextFormField), and password (TextFormField with obscureText). Include validation for non-empty fields and email format.

2. **Sign In Mode**: Display form fields for email and password. Include validation for non-empty fields and email format.

3. **Mode Toggle**: Include a button or switch to toggle between "Sign Up" and "Sign In" modes, updating the UI accordingly.

4. **Submit and View Details**: Add a "Submit" button that validates the form. Upon successful validation, display the entered details below the form (e.g., in a Card or ListTile showing name, email, etc., but hide password for security).

5. **Navigation**: Add a "Back" button to navigate back to the order screen.

Additional requirements:
- Use Flutter widgets like Form, TextFormField, and GlobalKey<FormState> for form handling and validation.
- Ensure the screen has a proper AppBar with a title like "Login".
- Handle edge cases: Show error messages for invalid inputs, ensure UI updates after mode switch.
- Integrate seamlessly with existing navigation; for example, from the order screen, add a button or menu item to navigate to this login screen.
- The screen should be responsive and follow Material Design guidelines.

Provide the updated code for `lib/views/login_screen.dart`, any necessary changes to `lib/views/order_screen.dart` for navigation, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/views/login_screen_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Drawer Menu Feature

I have a Flutter app for a sandwich shop. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with the home screen as `OrderScreen(maxQuantity: 5)`. The app has screens like order screen (`lib/views/order_screen.dart`), cart screen (`lib/views/cart_screen.dart`), checkout screen (`lib/views/checkout_screen.dart`), login screen (`lib/views/login_screen.dart`), and about screen (`lib/views/about_screen.dart`). The app uses a Cart model in `lib/models/cart.dart` and has routes defined in `onGenerateRoute` for `/about` and potentially others.

I need to implement a drawer menu to enhance the app's navigation. The drawer should be accessible from all screens and include menu items for navigating to the order screen, about screen, login screen, and any other relevant screens. To make the navigation responsive, on mobile screen widths (e.g., less than 600 pixels), use a standard drawer that slides out from the side. On computer screen widths (e.g., 600 pixels or more), use a persistent sidebar that remains visible alongside the screen content, providing better usability for larger screens.

Key requirements:
1. **Create AppDrawer Widget**: Develop a reusable `AppDrawer` widget in `lib/widgets/app_drawer.dart` that contains a `Drawer` with a header (e.g., app title) and `ListTile` items for navigation (Order, About, Login). Each item should use `Navigator.pushReplacementNamed` or similar for navigation and close the drawer.

2. **Responsive Navigation**: Use `LayoutBuilder` or `MediaQuery` to detect screen width. For widths < 600px, integrate the `AppDrawer` as a standard drawer in each screen's `Scaffold`. For widths >= 600px, implement a persistent sidebar: Use a `Row` in the `Scaffold` body with the `AppDrawer` (modified to a `Column` without `Drawer` wrapper) on the left and the screen content on the right, taking up a fixed width (e.g., 200 pixels).

3. **Integration with Screens**: Update all screens (`lib/views/order_screen.dart`, `lib/views/cart_screen.dart`, `lib/views/checkout_screen.dart`, `lib/views/login_screen.dart`, `lib/views/about_screen.dart`) to include the responsive navigation. For mobile, add `drawer: const AppDrawer()` to each `Scaffold`. For desktop, wrap the body in a `Row` with the sidebar.

4. **Navigation Handling**: Ensure drawer items close the drawer on mobile and handle navigation correctly. Add routes for `/login` in `lib/main.dart` if not present.

Additional requirements:
- The drawer/sidebar should have a consistent design with icons for each menu item.
- Handle edge cases: Ensure the sidebar doesn't interfere with small mobile screens, and the drawer works on all orientations.
- Integrate seamlessly with existing navigation; for example, preserve the back stack appropriately.
- Use Flutter widgets like `LayoutBuilder`, `MediaQuery`, and `Row` for responsiveness.

Provide the updated code for `lib/widgets/app_drawer.dart`, changes to all screen files (`lib/views/*.dart`), updates to `lib/main.dart` for routes, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/widgets/app_drawer_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.