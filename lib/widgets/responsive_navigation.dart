import 'package:flutter/material.dart';
import 'app_drawer.dart';

class ResponsiveNavigation extends StatelessWidget {
  final Widget body;
  final String? title;
  final Widget? leadingWidget;

  const ResponsiveNavigation({
    super.key,
    required this.body,
    this.title,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 600;
        final appBar = title != null
            ? AppBar(
                leading: isDesktop ? leadingWidget : null,
                title: Text(title!),
              )
            : null;
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
