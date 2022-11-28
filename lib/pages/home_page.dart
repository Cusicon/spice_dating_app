import 'package:flutter/material.dart';
import '../widgets/base_bottom_bar.dart';

import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(appTitle)),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
