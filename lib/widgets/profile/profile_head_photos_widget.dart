import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets.dart';

class ProfileHeadPhotos extends StatefulWidget {
  const ProfileHeadPhotos({
    Key? key,
    required this.height,
    required this.user,
    required this.paletteColor,
  }) : super(key: key);

  final double height;
  final User user;
  final Color paletteColor;

  @override
  State<ProfileHeadPhotos> createState() => _ProfileHeadPhotosState();
}

class _ProfileHeadPhotosState extends State<ProfileHeadPhotos> {
  final bool _isAMatch = false;

  final List<Map> _choices = [
    {
      'icon': LineIcons.donate,
      'title': 'Send a gift',
      'value': 'send-gift',
    },
    {
      'icon': LineIcons.heart,
      'title': 'Sweet! Save this...',
      'value': 'add-to-favourite',
    }
  ];

  final Map<String, String> _skipChoice = {
    'title': "Nah, I'm good...",
    'value': 'skip'
  };

  final PageController _pageController = PageController();

  String popupResponse = '';

  void _showOptionsModal(
    context,
  ) async {
    String response = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: _choices.map((choice) {
            return CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(choice['value']),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: minPaddingSize),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(choice['title']!),
                    Icon(choice['icon'], color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            );
          }).toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(_skipChoice['value']),
            isDestructiveAction: true,
            child: Text(_skipChoice['title']!),
          ),
        );
      },
    );

    setState(() {
      popupResponse = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = widget.user;

    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Container(
            color: widget.paletteColor,
            child: PageView.builder(
              controller: _pageController,
              itemCount: user.photos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ImageContainer(
                  imageUrl: user.photos[index],
                );
              },
            ),
          ),
          if (_isAMatch)
            SizedBox(
              child: Stack(children: [
                Center(
                  child: Lottie.asset(loveFloating),
                ),
              ]),
            ),
          Align(
            alignment: Alignment.topCenter,
            child: ShaderMask(
              shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white,
                ],
                stops: const [0.6, 1],
              ).createShader(rect),
              blendMode: BlendMode.dstOut,
              child: Container(
                height: widget.height * 0.20,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.paletteColor,
                      widget.paletteColor.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShaderMask(
              shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.6),
                ],
                stops: const [0.6, 1],
              ).createShader(rect),
              blendMode: BlendMode.dstOut,
              child: Container(
                height: widget.height * 0.15,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.paletteColor.withOpacity(0.6),
                      widget.paletteColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
          _topAppBar(context, user),
        ],
      ),
    );
  }

  Align _topAppBar(BuildContext context, User user) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(
          top: pagePaddingSize * 1.25,
          left: minPaddingSize,
          right: minPaddingSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _iconButton(
              context,
              color: widget.paletteColor,
              borderedRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  LineIcons.angleDown,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 8.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(pagePaddingSize),
                ),
              ),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: user.photos.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: appDarkGrey,
                  dotColor: widget.paletteColor,
                  dotHeight: 4.0,
                  dotWidth: 6.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconButton(
                  context,
                  color: widget.paletteColor,
                  borderedRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () => _showOptionsModal(context),
                    icon: const Icon(
                      LineIcons.horizontalEllipsis,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 8.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _iconButton(
    BuildContext context, {
    required Color color,
    required IconButton child,
    required BorderRadiusGeometry borderedRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: borderedRadius,
      ),
      child: child,
    );
  }
}
