import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.scrollController,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/profile';

  final User user;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final double headHeight = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          ProfileHeadPhotos(height: headHeight, user: user),
          ProfileHeadPhotos(height: headHeight, user: user),
        ],
      ),
    );
  }
}
