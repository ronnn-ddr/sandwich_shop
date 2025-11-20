import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/widgets/responsive_navigation.dart';

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
      widget.cart
          .updateQuantity(sandwich, (widget.cart.items[sandwich] ?? 0) + 1);
    });
  }

  void _decreaseQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart
          .updateQuantity(sandwich, (widget.cart.items[sandwich] ?? 0) - 1);
    });
  }

  void _removeItem(Sandwich sandwich) {
    setState(() {
      widget.cart.removeItem(sandwich);
    });
  }

  Future<void> _navigateToCheckout() async {
    if (widget.cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(cart: widget.cart),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        widget.cart.clear();
      });

      final String orderId = result['orderId'] as String;
      final String estimatedTime = result['estimatedTime'] as String;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Order $orderId confirmed! Estimated time: $estimatedTime'),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
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
    return ResponsiveNavigation(
      title: 'Cart View',
      leadingWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: Image.asset('assets/images/logo.png'),
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
                Builder(
                  builder: (BuildContext context) {
                    final bool cartHasItems = widget.cart.items.isNotEmpty;
                    if (cartHasItems) {
                      return StyledButton(
                        onPressed: _navigateToCheckout,
                        icon: Icons.payment,
                        label: 'Checkout',
                        backgroundColor: Colors.orange,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
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
