import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class GalleryControls extends StatelessWidget {
  const GalleryControls({
    Key? key,
    required this.shuffleUsers,
  }) : super(key: key);

  final Function shuffleUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: minSizedBox / 2),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: appLightGrey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: appNormalGrey,
            ),
            child: Row(
              children: const [
                Icon(LineIcons.times),
                SizedBox(width: minSizedBox),
                Text('Skip'),
              ],
            ),
          ),
          const SizedBox(),
          TextButton(
            onPressed: () => shuffleUsers(),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: const [
                Text('Shuffle'),
                SizedBox(width: minSizedBox),
                Icon(LineIcons.random),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
