import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: const Text(appTitle),
      bottomNavigationBar: const GNav(
        tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.home),
          GButton(icon: Icons.home),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
