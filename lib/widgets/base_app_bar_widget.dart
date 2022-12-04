import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logo = '/assets/icons/logo.png';
  final AppBar appBar;
  final List<Widget> actions;

  /// you can add more fields that meet your needs

  const BaseAppBar({
    Key? key,
    required this.appBar,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: Colors.transparent,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}
