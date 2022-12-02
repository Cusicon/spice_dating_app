import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/profile';

  final User user;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      body: Column(
        children: [
          ProfileHeadPhotos(height: height, user: user),
        ],
      ),
    );
  }
}
