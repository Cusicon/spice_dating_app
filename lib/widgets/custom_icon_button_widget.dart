import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.color,
    required this.child,
    required this.borderedRadius,
    required this.onPressed,
    this.border,
    this.height,
    this.width,
    this.relativeIconSizeToParentHeight = 0.0,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color color;
  final Widget child;
  final BorderRadiusGeometry borderedRadius;
  final BoxBorder? border;
  final Function onPressed;
  final double relativeIconSizeToParentHeight;

  static double? constraintsMaxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderedRadius,
        border: border,
      ),
      child: LayoutBuilder(
        builder: (ctx, constraints) => Transform.scale(
          scaleX: -1,
          child: IconButton(
            iconSize: relativeIconSizeToParentHeight != 0.0
                ? constraints.maxHeight * relativeIconSizeToParentHeight
                : null,
            onPressed: () => onPressed(),
            icon: child,
          ),
        ),
      ),
    );
  }
}
