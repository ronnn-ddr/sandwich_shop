import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  void _goBack() {
    Navigator.pop(context);
  }

  void _increaseQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart.updateQuantity(sandwich, (widget.cart.items[sandwich] ?? 0) + 1);
    });
  }

  void _decreaseQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart.updateQuantity(sandwich, (widget.cart.items[sandwich] ?? 0) - 1);
    });
  }

  void _removeItem(Sandwich sandwich) {
    setState(() {
      widget.cart.removeItem(sandwich);
    });
  }

  String _getSizeText(bool isFootlong) {
    if (isFootlong) {
      return 'Footlong';
    } else {
      return 'Six-inch';
    }
  }

  double _getItemPrice(Sandwich sandwich, int quantity) {
    return sandwich.price * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: const Text(
          'Cart View',
          style: heading1,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              if (widget.cart.items.isEmpty)
                Column(
                  children: [
                    const Text(
                      'Your cart is empty',
                      style: heading2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    StyledButton(
                      onPressed: _goBack,
                      icon: Icons.shopping_cart,
                      label: 'Start Ordering',
                      backgroundColor: Colors.green,
                    ),
                  ],
                )
              else ...[
                for (var entry in widget.cart.items.entries)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(entry.key.name, style: heading2),
                                Text(
                                  '${_getSizeText(entry.key.isFootlong)} on ${entry.key.breadType.name} bread',
                                  style: normalText,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _decreaseQuantity(entry.key),
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            '${entry.value}',
                            style: heading2,
                          ),
                          IconButton(
                            onPressed: () => _increaseQuantity(entry.key),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '£${_getItemPrice(entry.key, entry.value).toStringAsFixed(2)}',
                            style: normalText,
                          ),
                          IconButton(
                            onPressed: () => _removeItem(entry.key),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                Text(
                  'Total: £${widget.cart.totalPrice.toStringAsFixed(2)}',
                  style: heading2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                StyledButton(
                  onPressed: _goBack,
                  icon: Icons.arrow_back,
                  label: 'Back to Order',
                  backgroundColor: Colors.grey,
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
