import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spice_dating_app/utils/colors.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.scrollController,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/profile';

  final User user;
  final ScrollController scrollController;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late PaletteColor paletteColor;

  @override
  void initState() {
    super.initState();
    paletteColor = PaletteColor(Colors.transparent, 20);
  }

  Future<void> _getPaletteColors(String imagePath) async {
    final PaletteColor palette = await generatePalette(imagePath);

    setState(() {
      paletteColor = palette;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double headHeight = MediaQuery.of(context).size.height * 0.7;

    Color _color = paletteColor.color;

    _getPaletteColors(widget.user.photos.first);

    return Scaffold(
      body: ListView(
        controller: widget.scrollController,
        children: [
          ProfileHeadPhotos(
            height: headHeight,
            user: widget.user,
            paletteColor: _color,
          ),
          FractionalTranslation(
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
          )
        ],
      ),
    );
  }
}
