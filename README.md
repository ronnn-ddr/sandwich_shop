# Sandwich Shop App

A Flutter application for ordering sandwiches with customizable options like size, bread type, and special requests.

## Description

The Sandwich Shop App allows users to build and order sandwiches by selecting quantity, size (Footlong or Six-inch), bread type (white, wheat, or wholemeal), and adding special notes for requests like "no onions" or "extra pickles". The app calculates and displays the total price based on selections and features a simple UI with buttons to adjust quantity, switches for size and toasting, a dropdown for bread type, and a text field for notes. It uses state management via `OrderRepository` and `PricingRepository` to handle order logic and pricing.

Key features:
- Increment/decrement sandwich quantity with boundary checks.
- Select sandwich size using switches (Footlong or Six-inch).
- Choose bread type from a dropdown menu (white, wheat, or wholemeal).
- Toggle toasting preference with a switch.
- Add special requests via a text input field.
- Calculate and display total order price based on quantity, size, and base pricing.
- Display current order details in an `OrderItemDisplay` widget.
- Styled buttons for a consistent UI.

## Prerequisites

Before running the app, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0 or later recommended).
- Dart SDK (comes with Flutter).
- An IDE like Visual Studio Code with Flutter extensions, or Android Studio.
- A connected device or emulator (Android/iOS) for testing.

## Cloning the Repository

Clone the project from your Git repository:

```bash
git clone https://github.com/your-username/sandwich-shop-app.git
cd sandwich-shop-app
```

Replace `your-username` with your actual GitHub username or repository URL.

## Installation

1. Navigate to the project directory:
   ```bash
   cd sandwich-shop-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

   This will download all required packages listed in [`pubspec.yaml`](pubspec.yaml ).

## Running the Project

1. Ensure a device or emulator is connected:
   - For Android: `flutter devices` to list devices, then `flutter run`.
   - For iOS (macOS only): Ensure Xcode is installed, then `flutter run`.

2. Run the app:
   ```bash
   flutter run
   ```

   The app will launch on your connected device/emulator, displaying the OrderScreen.

## Using the Project

- **Quantity Control**: Use the "Add" and "Remove" buttons to adjust the number of sandwiches (max 10 by default).
- **Size Selection**: Toggle between "Footlong" and "Six-inch" using the switch.
- **Bread Type**: Select from white, wheat, or wholemeal using the dropdown menu.
- **Toasting**: Toggle between toasted and untoasted using the switch.
- **Special Requests**: Enter notes in the text field (e.g., "no onions, extra pickles").
- **Price Display**: View the total price of your order in the `OrderItemDisplay` widget, calculated based on quantity and size.
- **Order Display**: View the current order details in the `OrderItemDisplay` widget, showing quantity, size, bread type, and notes.

The app uses `OrderRepository` for state management and `PricingRepository` for price calculations, ensuring changes are validated and updated in real-time.

## Running Tests

The project includes widget tests in [`test/views/widget_test.dart`](test/views/widget_test.dart ) to verify UI behavior.

1. Run all tests:
   ```bash
   flutter test
   ```

2. Run tests with coverage (optional):
   ```bash
   flutter test --coverage
   ```

   Tests cover scenarios like initial quantity display, increment/decrement, boundary checks, and widget rendering.

## Project Structure

- [`lib/main.dart`](lib/main.dart ): Main app entry point with `App` and `OrderScreen` widgets.
- [`lib/views/app_styles.dart`](lib/views/app_styles.dart ): Custom styles for UI elements.
- [`lib/repositories/order_repository.dart`](lib/repositories/order_repository.dart ): Handles order state and logic.
- [`lib/repositories/pricing_repository.dart`](lib/repositories/pricing_repository.dart ): Handles pricing calculations for sandwiches.
- [`test/views/widget_test.dart`](test/views/widget_test.dart ): Widget tests for UI components.
