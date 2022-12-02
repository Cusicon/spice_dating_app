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
      padding: const EdgeInsets.symmetric(vertical: minSizedBox),
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
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.grey),
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
            style: const ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color(appSecondaryColor)),
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
