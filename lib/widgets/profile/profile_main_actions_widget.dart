import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets.dart';

class ProfileMainActions extends StatelessWidget {
  const ProfileMainActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(0, -0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LineIcons.pause,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 2.5,
                  width: 50,
                  child: LoadingBar(
                    left: 0.0,
                    top: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    backgroundColor: appLightGrey,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: pagePaddingSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomIconButton(
                  color: appNormalGrey,
                  height: 75.0,
                  width: 75.0,
                  relativeIconSizeToParentHeight: 0.5,
                  border: Border.all(
                    width: borderWidth * 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  borderedRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    LineIcons.photoVideo,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: minSizedBox),
                CustomIconButton(
                  color: const Color(appPrimaryColor),
                  height: 100.0,
                  width: 100.0,
                  relativeIconSizeToParentHeight: 0.5,
                  border: Border.all(
                    width: borderWidth * 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  borderedRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    LineIcons.commentDots,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
