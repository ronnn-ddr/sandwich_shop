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