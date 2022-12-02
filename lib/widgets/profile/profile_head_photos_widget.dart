import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import '../../models/user_model.dart';
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
  final bool isAMatch = false;

  final List<Map> choices = [
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

  final Map<String, String> skipChoice = {
    'title': "Nah, I'm good...",
    'value': 'skip'
  };

  String popupResponse = '';

  void _showOptionsModal(
    context,
  ) async {
    String response = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: choices.map((choice) {
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
            onPressed: () => Navigator.of(context).pop(skipChoice['value']),
            isDestructiveAction: true,
            child: Text(skipChoice['title']!),
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
          PageView.builder(
            itemCount: user.photos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ImageContainer(
                imageUrl: user.photos[index],
              );
            },
          ),
          if (isAMatch)
            SizedBox(
              child: Stack(children: [
                Center(
                  child: Lottie.asset(loveFloating),
                ),
              ]),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShaderMask(
              shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.5),
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
                      widget.paletteColor.withOpacity(0.5),
                      widget.paletteColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _topAppBar(context),
          ),
        ],
      ),
    );
  }

  Container _topAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: pagePaddingSize * 1.5,
        left: minPaddingSize,
        right: minPaddingSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
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
            ],
          ),
        ],
      ),
    );
  }
}
