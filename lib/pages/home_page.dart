import 'package:flutter/material.dart';

import '../widgets/base_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
      bottomNavigationBar: const BaseBottomBar(),
    );
  }
}
