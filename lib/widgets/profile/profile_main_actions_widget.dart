import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets.dart';

class ProfileMainActions extends StatelessWidget {
  const ProfileMainActions({
    Key? key,
    this.bgPaletteColor,
  }) : super(key: key);

  final Color? bgPaletteColor;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(0, -0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Opacity(
            opacity: 0.333,
            child: SizedBox(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.pause,
                      color: Theme.of(context).primaryColor,
                      size: 16.0,
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: pagePaddingSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: borderWidth * 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CustomIconButton(
                      color: appSecondaryColor,
                      height: 64.0,
                      width: 64.0,
                      relativeIconSizeToParentHeight: 0.5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      onPressed: () {},
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey.shade200,
                        period: const Duration(seconds: 2),
                        child: Transform.scale(
                          scaleX: -1,
                          child: const Icon(
                            LineIcons.photoVideo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: minSizedBox),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: borderWidth * 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: appPrimaryColor.withOpacity(0.4),
                          spreadRadius: 4.0,
                          offset: const Offset(0, 8),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: CustomIconButton(
                      color: appPrimaryColor,
                      height: 88.0,
                      width: 88.0,
                      relativeIconSizeToParentHeight: 0.5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      onPressed: () {},
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey.shade200,
                        period: const Duration(seconds: 2),
                        child: Transform.scale(
                          scaleX: -1,
                          child: const Icon(
                            FontAwesomeIcons.solidMessage,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
