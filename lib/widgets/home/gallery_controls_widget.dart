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
            color: appLoadingBackgroundColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(LineIcons.times),
                const SizedBox(width: minSizedBox),
                Text(
                  'Skip',
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
          const SizedBox(),
          TextButton(
            onPressed: () => shuffleUsers(),
            child: Row(
              children: [
                Text(
                  'Shuffle',
                  style: Theme.of(context).textTheme.button,
                ),
                const SizedBox(width: minSizedBox),
                const Icon(LineIcons.random),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
