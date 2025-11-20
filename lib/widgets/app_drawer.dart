import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            'Sandwich Shop',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Order'),
          onTap: () {
            final scaffoldState = Scaffold.of(context);
            if (scaffoldState.isDrawerOpen) {
              Navigator.of(context).pop();
            }
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            final scaffoldState = Scaffold.of(context);
            if (scaffoldState.isDrawerOpen) {
              Navigator.of(context).pop();
            }
            Navigator.pushReplacementNamed(context, '/about');
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Sign-Up & Login'),
          onTap: () {
            final scaffoldState = Scaffold.of(context);
            if (scaffoldState.isDrawerOpen) {
              Navigator.of(context).pop();
            }
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
