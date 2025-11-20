### Feature Requirements Document: Cart Item Modification

#### 1. Feature Description and Purpose
The cart item modification feature allows users to edit the contents of their shopping cart directly from the cart screen in the Flutter sandwich shop app. This includes increasing or decreasing the quantity of individual items and removing items entirely. The purpose is to provide flexibility and convenience, enabling users to adjust their orders without returning to the order screen, thereby improving user experience, reducing cart abandonment, and ensuring accurate order totals in real-time.

#### 2. User Stories
##### Quantity Adjustment and Automatic Removal
- As a user, I want to increase the quantity of a sandwich in my cart so that I can order more without going back to the order screen.
- As a user, I want to decrease the quantity of a sandwich in my cart so that I can adjust my order easily.
- As a user, I want an item to be automatically removed from my cart if I reduce its quantity to zero, so that my cart stays clean.

##### Item Removal
- As a user, I want to remove a specific item from my cart entirely, so that I can delete unwanted items quickly.

##### Real-Time Updates and Empty Cart Handling
- As a user, I want to see the updated total price immediately after modifying my cart, so that I know the cost of my changes.
- As a user, I want a clear indication if my cart is empty after modifications, with an option to return to shopping, so that I can continue or complete my order.

#### 3. Acceptance Criteria
##### UI and Display
- [ ] The cart screen displays each item with its name, current quantity, and price.
- [ ] Each item has + and - buttons for quantity adjustment.
- [ ] Each item has a remove button (e.g., trash icon) that deletes the item when tapped.
- [ ] The UI uses ListView.builder for item display and refreshes immediately without errors.
- [ ] Center the bread type text for each cart item.
- [ ] Position the delete button next to the item price.

##### Functionality
- [ ] Tapping + increases quantity by 1, updates the Cart model, recalculates the total price, and refreshes the UI.
- [ ] Tapping - decreases quantity by 1; if quantity reaches 0, the item is removed.
- [ ] Tapping remove button deletes the item, updates the model, and refreshes the UI.
- [ ] The total price updates in real-time after any modification.
- [ ] Provide user feedback (e.g., snackbar) for remove and update actions.

##### Edge Cases and Navigation
- [ ] If the cart becomes empty, a message "Your cart is empty" is shown, along with a button to navigate back to the order screen.
- [ ] Ensure the cart screen has a way to navigate back to the order screen (e.g., via AppBar back button or a custom button).
- [ ] Changes persist in the Cart model, and the app builds and runs without issues.

##### Testing
- [ ] Unit tests cover the new functionality, including quantity changes, removals, and empty cart states.

#### 4. Subtasks
- Implement + and - quantity adjustment for each cart item.
- Implement logic to automatically remove an item if quantity reaches 0.
- Add remove button for each cart item.
- Update total price calculation in real-time.
- Handle empty cart display and navigation.
- Ensure the total price and UI update after any changes.

### Feature Requirements Document: Login Screen

#### 1. Feature Description and Purpose
The login screen feature allows users to sign up for a new account or sign in to an existing account in the Flutter sandwich shop app. It provides a form-based interface for entering user details such as name, email, and password, with validation to ensure data integrity. Upon successful submission, the entered details are displayed on the screen for verification. The purpose is to prepare the app for user authentication and personalization, enabling future backend integration for secure account management, order history, and customized experiences, while currently serving as a front-end form handler.

#### 2. User Stories
##### Sign-Up Process
- As a new user, I want to enter my name, email, and password to create an account, so that I can register for the sandwich shop app.
- As a new user, I want validation on my inputs (e.g., email format, non-empty fields), so that I know my information is correct before submitting.

##### Sign-In Process
- As a returning user, I want to enter my email and password to sign in, so that I can access my account and previous orders.
- As a returning user, I want validation on my inputs, so that I can correct any mistakes before submitting.

##### Mode Switching and Detail Viewing
- As a user, I want to toggle between "Sign Up" and "Sign In" modes, so that I can choose the appropriate action based on whether I have an account.
- As a user, I want to view my entered details (name, email, but not password) after successful submission, so that I can confirm the information is accurate.

##### Navigation
- As a user, I want a "Back" button to return to the order screen, so that I can continue shopping without signing in if I choose.

#### 3. Acceptance Criteria
##### UI and Display
- [ ] The screen has an AppBar with the title "Login".
- [ ] A toggle button or switch allows switching between "Sign Up" and "Sign In" modes.
- [ ] In Sign Up mode: Display TextFormField for name, email, and password (obscured).
- [ ] In Sign In mode: Display TextFormField for email and password (obscured).
- [ ] After valid submission, display entered details in a Card or ListTile below the form (hide password).
- [ ] Include a "Back" button to navigate to the order screen.
- [ ] UI follows Material Design guidelines and is responsive.

##### Functionality
- [ ] Form uses GlobalKey<FormState> for validation.
- [ ] Validation: All fields non-empty; email matches standard format.
- [ ] Submit button validates the form and displays details on success.
- [ ] Mode switch updates the form fields dynamically without losing state inappropriately.
- [ ] Navigation integrates with existing app flow (e.g., from order screen via a button).

##### Edge Cases and Error Handling
- [ ] Show error messages for invalid inputs (e.g., "Please enter a valid email").
- [ ] Prevent submission if form is invalid.
- [ ] Handle mode switch gracefully, clearing or preserving relevant fields.

##### Testing and Integration
- [ ] The app builds and runs without errors after implementation.
- [ ] Unit tests cover form validation, mode switching, and detail display.
- [ ] Integrate navigation from order screen (e.g., add a login button).

#### 4. Subtasks
- Create the login_screen.dart file with Form and TextFormField widgets.
- Implement mode toggle logic to switch between Sign Up and Sign In.
- Add form validation for fields.
- Handle form submission and display entered details.
- Add navigation back to order screen.
- Update order_screen.dart to include navigation to login screen.
- Write unit tests for the new functionality.

### Feature Requirements Document: Drawer Menu

#### 1. Feature Description and Purpose
The drawer menu feature adds a navigation drawer to the Flutter sandwich shop app, accessible from all screens, providing menu items for key app sections like Order, About, and Login. The drawer adapts responsively: on mobile devices (screen width < 600px), it functions as a standard sliding drawer; on larger screens (e.g., desktops, width >= 600px), it becomes a persistent sidebar for improved usability. The purpose is to enhance navigation consistency and user experience across devices, allowing easy access to app features without relying solely on back buttons or manual navigation, while promoting better organization and responsiveness in the UI.

#### 2. User Stories
##### Mobile Navigation
- As a mobile user, I want a sliding drawer menu accessible from any screen, so that I can navigate to different parts of the app (e.g., Order, About, Login) without losing my current context.
- As a mobile user, I want the drawer to close automatically after selecting a menu item, so that I can focus on the new screen content.

##### Desktop Navigation
- As a desktop user, I want a persistent sidebar visible alongside the screen content, so that I can quickly switch between sections without the sidebar disappearing.
- As a desktop user, I want the sidebar to take up a fixed width (e.g., 200 pixels), so that it doesn't overwhelm the main content area.

##### General Navigation
- As a user, I want consistent menu items with icons (e.g., home for Order, info for About, login for Login), so that the navigation is intuitive and visually appealing.
- As a user, I want the drawer/sidebar to integrate seamlessly with the app's existing navigation, preserving the back stack appropriately when switching screens.

#### 3. Acceptance Criteria
##### UI and Design
- [ ] Create `lib/widgets/app_drawer.dart` with a `Drawer` widget containing a header (app title) and `ListTile` items for Order, About, and Login, each with an icon.
- [ ] The drawer/sidebar has a consistent design across all screens, with Material Design compliance.
- [ ] On mobile (width < 600px), the drawer slides out from the side when the AppBar hamburger icon is tapped.
- [ ] On desktop (width >= 600px), the sidebar is a persistent `Column` in a `Row` layout, fixed at 200 pixels width, alongside the screen content.

##### Functionality
- [ ] Use `LayoutBuilder` or `MediaQuery` to detect screen width and switch between drawer and sidebar modes.
- [ ] Menu items use `Navigator.pushReplacementNamed` for navigation and close the drawer on mobile.
- [ ] Add `/login` route in [`lib/main.dart`](lib/main.dart ) if not present, ensuring all routes are defined.
- [ ] Integrate with all screens: [`lib/views/order_screen.dart`](lib/views/order_screen.dart ), [`lib/views/cart_screen.dart`](lib/views/cart_screen.dart ), [`lib/views/checkout_screen.dart`](lib/views/checkout_screen.dart ), [`lib/views/login_screen.dart`](lib/views/login_screen.dart ), [`lib/views/about_screen.dart`](lib/views/about_screen.dart ) by adding `drawer: const AppDrawer()` for mobile or wrapping body in `Row` for desktop.

##### Responsiveness and Edge Cases
- [ ] The sidebar does not interfere with small mobile screens; drawer works in all orientations.
- [ ] Handle navigation correctly: Preserve back stack, avoid duplicate routes.
- [ ] The app builds and runs without errors on both mobile and desktop emulators/simulators.

##### Testing
- [ ] Unit tests in `test/widgets/app_drawer_test.dart` cover drawer/sidebar rendering, menu item taps, and responsive behavior.

#### 4. Subtasks
- Create the AppDrawer widget in `lib/widgets/app_drawer.dart`.
- Implement responsive navigation logic using LayoutBuilder.
- Update all screen files for mobile drawer integration.
- Update all screen files for desktop sidebar integration.
- Update [`lib/main.dart`](lib/main.dart ) to include the `/login` route.
- Write unit tests for the drawer functionality.