import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  String _notes = '';
  String _selectedSize = 'Footlong';

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              _selectedSize,
              _notes,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Special Requests',
                    hintText: 'e.g., no onions, extra pickles',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => _notes = value);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: StyledButton(
                    onPressed: _quantity < widget.maxQuantity
                        ? _increaseQuantity
                        : null,
                    label: 'Add',
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: StyledButton(
                    onPressed: _quantity > 0 ? _decreaseQuantity : null,
                    label: 'Remove',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment<String>(
                    value: 'Six-inch',
                    label: Text('Six-inch'),
                  ),
                  ButtonSegment<String>(
                    value: 'Footlong',
                    label: Text('Footlong'),
                  ),
                ],
                selected: {_selectedSize},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _selectedSize = newSelection.first;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color color;

  const StyledButton({
    required this.onPressed,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
        child: Text(label),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;
  final String notes;

  const OrderItemDisplay(this.quantity, this.itemType, this.notes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
        if (notes.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Notes: $notes',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
      ],
    );
  }
}
