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

  void _increaseQuantity(CartItem item) {
    setState(() {
      widget.cart.updateQuantity(item, item.quantity + 1);
    });
  }

  void _decreaseQuantity(CartItem item) {
    setState(() {
      widget.cart.updateQuantity(item, item.quantity - 1);
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
              for (CartItem item in widget.cart.items)
                Column(
                  children: [
                    Text(item.sandwich.name, style: heading2),
                    Text(
                      '${_getSizeText(item.sandwich.isFootlong)} on ${item.sandwich.breadType.name} bread',
                      style: normalText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => _decreaseQuantity(item),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          '${item.quantity}',
                          style: heading2,
                        ),
                        IconButton(
                          onPressed: () => _increaseQuantity(item),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Text(
                      '£${_getItemPrice(item.sandwich, item.quantity).toStringAsFixed(2)}',
                      style: normalText,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
