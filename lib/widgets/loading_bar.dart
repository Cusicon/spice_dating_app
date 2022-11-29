import 'package:flutter/material.dart';
import '../utils/colors.dart';

import '../utils/constants.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        pagePaddingSize,
        minSizedBox,
        pagePaddingSize,
        minSizedBox,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: LinearProgressIndicator(
          value: controller.value,
          backgroundColor: appLoadingBackgroundColor,
          semanticsLabel: 'Linear progress indicator',
          color: const Color(appPrimaryColor),
        ),
      ),
    );
  }
}
