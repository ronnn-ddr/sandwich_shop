import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/login_screen.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('displays AppBar with title Login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      expect(find.text('Login'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('has toggle switch between Sign Up and Sign In',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Sign Up'), findsNWidgets(2)); // Label and button
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('shows name field only in Sign Up mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Initially in Sign Up mode
      expect(find.widgetWithText(TextFormField, 'Name'), findsOneWidget);

      // Toggle to Sign In
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(find.widgetWithText(TextFormField, 'Name'), findsNothing);
    });

    testWidgets('shows email and password fields in both modes',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);

      // Toggle to Sign In
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
    });

    testWidgets('validates name field in Sign Up mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Leave name empty, fill others
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'password');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Please enter your name'), findsOneWidget);
    });

    testWidgets('validates email field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Invalid email
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'invalid');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'password');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('validates password field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Leave password empty
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Name'), 'John Doe');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'test@example.com');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('displays submitted details after valid Sign Up',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      await tester.enterText(
          find.widgetWithText(TextFormField, 'Name'), 'John Doe');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'password');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Submitted Details:'), findsOneWidget);
      expect(find.text('Name: John Doe'), findsOneWidget);
      expect(find.text('Email: test@example.com'), findsOneWidget);
      expect(
          find.descendant(
              of: find.byType(Card), matching: find.textContaining('password')),
          findsNothing);
    });

    testWidgets('displays submitted details after valid Sign In',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Switch to Sign In
      await tester.tap(find.byType(Switch));
      await tester.pump();

      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'password');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
      await tester.pump();

      expect(find.text('Submitted Details:'), findsOneWidget);
      expect(find.text('Name:'), findsNothing); // No name in Sign In
      expect(find.text('Email: test@example.com'), findsOneWidget);
    });

    testWidgets('has Back button that pops the screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen())),
            child: const Text('Go to Login'),
          ),
        ),
      ));

      await tester.tap(find.text('Go to Login'));
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);

      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      expect(find.text('Go to Login'), findsOneWidget);
    });
  });
}
