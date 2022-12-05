import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({
    Key? key,
    this.left = pagePaddingSize,
    this.top = minSizedBox,
    this.right = pagePaddingSize,
    this.bottom = minSizedBox,
    this.backgroundColor = appNormalGrey,
    this.color = appPrimaryColor,
  }) : super(key: key);

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Color? backgroundColor;
  final Color color;

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
      padding: EdgeInsets.fromLTRB(
        widget.left,
        widget.top,
        widget.right,
        widget.bottom,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: LinearProgressIndicator(
          value: controller.value,
          backgroundColor: widget.backgroundColor,
          semanticsLabel: 'Linear progress indicator',
          color: widget.color,
        ),
      ),
    );
  }
}
