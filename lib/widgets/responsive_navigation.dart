import 'package:flutter/material.dart';
import 'app_drawer.dart';

class ResponsiveNavigation extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const ResponsiveNavigation({
    super.key,
    required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 600;
        if (isDesktop) {
          // Desktop: Persistent sidebar
          return Scaffold(
            appBar: appBar,
            body: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: const AppDrawer(),
                ),
                Expanded(child: body),
              ],
            ),
          );
        } else {
          // Mobile: Drawer
          return Scaffold(
            appBar: appBar,
            drawer: Drawer(child: const AppDrawer()),
            body: body,
          );
        }
      },
    );
  }
}
