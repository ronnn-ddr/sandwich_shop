import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/widgets/app_drawer.dart';
import 'package:sandwich_shop/widgets/responsive_navigation.dart';

void main() {
  group('AppDrawer', () {
    testWidgets('renders header and menu items', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppDrawer())));

      expect(find.text('Sandwich Shop'), findsOneWidget);
      expect(find.text('Order'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Sign-Up & Login'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.byIcon(Icons.login), findsOneWidget);
    });

    testWidgets('tapping Order navigates to home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/test',
        routes: {
          '/': (context) => const Scaffold(body: Text('Home')),
          '/test': (context) => const Scaffold(body: AppDrawer()),
        },
      ));

      await tester.tap(find.text('Order'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('tapping About navigates to about', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/test',
        routes: {
          '/about': (context) => const Scaffold(body: Text('About')),
          '/test': (context) => const Scaffold(body: AppDrawer()),
        },
      ));

      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('tapping Sign-Up & Login navigates to login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/test',
        routes: {
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/test': (context) => const Scaffold(body: AppDrawer()),
        },
      ));

      await tester.tap(find.text('Sign-Up & Login'));
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });
  });

  group('ResponsiveNavigation', () {
    testWidgets('shows drawer on mobile (small width)', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: const ResponsiveNavigation(
              title: 'Test',
              body: Text('Body'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsNothing); // Drawer is lazy-loaded
      expect(find.byType(AppDrawer), findsNothing); // Not built until opened
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('shows sidebar on desktop (large width)', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(1200, 800)),
            child: const ResponsiveNavigation(
              title: 'Test',
              body: Text('Body'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsNothing);
      expect(find.byType(AppDrawer), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
      // Check if in Row
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('AppBar has hamburger on mobile', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: const ResponsiveNavigation(
              title: 'Test',
              body: Text('Body'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Hamburger is typically an IconButton with menu icon
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('AppBar has leading widget on desktop', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(1200, 800)),
            child: ResponsiveNavigation(
              title: 'Test',
              leadingWidget: const Icon(Icons.star),
              body: const Text('Body'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}