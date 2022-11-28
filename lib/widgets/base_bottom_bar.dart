import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constants.dart';

class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> menus = [
      {'icon': LineIcons.thLarge, "text": 'Cards'},
      {'icon': LineIcons.commentDots, "text": 'Inbox'},
      {'icon': LineIcons.heart, "text": 'Likes'},
      {'icon': LineIcons.user, "text": 'Profile'},
    ];

    return Container(
      padding: const EdgeInsets.all(pagePaddingSize),
      child: GNav(
        haptic: true,
        tabs: menus.map((menu) {
          return GButton(
            icon: menu['icon'],
            text: menu['text'],
            gap: minPaddingSize,
          );
        }).toList(),
      ),
    );
  }
}
