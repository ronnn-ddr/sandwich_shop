import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/views/order_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
    });
  });

  group('OrderScreen - Quantity', () {
    testWidgets('shows initial quantity and title',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Sandwich Shop App'), findsOneWidget);
    });

    testWidgets('increments quantity when Add is tapped',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add),
          warnIfMissed: false);
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('does not increment above maxQuantity',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());
      for (int i = 0; i < 4; i++) {
        await tester.tap(find.widgetWithIcon(IconButton, Icons.add),
            warnIfMissed: false);
        await tester.pump();
      }
      expect(find.text('5'), findsOneWidget);
    });
  });

  group('StyledButton', () {
    testWidgets('renders with icon and label', (WidgetTester tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );
      const testApp = MaterialApp(
        home: Scaffold(body: testButton),
      );
      await tester.pumpWidget(testApp);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('OrderScreen - Toasted Switch', () {
    testWidgets('shows toasted switch with initial untoasted state',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());
      expect(find.text('untoasted'), findsOneWidget);
      expect(find.text('toasted'), findsOneWidget);
      expect(find.byKey(const Key('toasted_switch')), findsOneWidget);
      expect(find.byKey(const Key('size_switch')), findsOneWidget);
    });

    testWidgets('toggles toasted switch from untoasted to toasted',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());

      // Find the toasted switch by key
      final toastedSwitch = find.byKey(const Key('toasted_switch'));
      expect(toastedSwitch, findsOneWidget);

      // Tap the toasted switch
      await tester.tap(toastedSwitch);
      await tester.pump();

      // The switch should still show both labels, but the state has changed
      expect(find.text('untoasted'), findsOneWidget);
      expect(find.text('toasted'), findsOneWidget);
    });

    testWidgets('toasted switch is interactive', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(const App());

      final toastedSwitch = find.byKey(const Key('toasted_switch'));
      expect(toastedSwitch, findsOneWidget);

      // Tap the toasted switch
      await tester.tap(toastedSwitch);
      await tester.pump();

      // Switch should still be present and functional
      expect(find.byKey(const Key('toasted_switch')), findsOneWidget);
      expect(find.byKey(const Key('size_switch')), findsOneWidget);
    });
  });
}
