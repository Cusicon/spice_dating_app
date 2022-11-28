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
    return Container(
      padding: const EdgeInsets.all(pagePaddingSize),
      child: const GNav(
        haptic: true, // haptic feedback
        tabs: [
          GButton(
            icon: LineIcons.thLarge,
            text: 'Cards',
            gap: minPaddingSize,
          ),
          GButton(
            icon: LineIcons.commentDots,
            text: 'Inbox',
            gap: minPaddingSize,
          ),
          GButton(
            icon: LineIcons.heart,
            text: 'Likes',
            gap: minPaddingSize,
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
            gap: minPaddingSize,
          ),
        ],
      ),
    );
  }
}
