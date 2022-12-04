import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.color,
    required this.child,
    required this.onPressed,
    this.borderRadius,
    this.border,
    this.height,
    this.width,
    this.relativeIconSizeToParentHeight = 0.0,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color color;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
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
        borderRadius: borderRadius,
        border: border,
      ),
      child: LayoutBuilder(
        builder: (ctx, constraints) => IconButton(
          iconSize: relativeIconSizeToParentHeight != 0.0
              ? constraints.maxHeight * relativeIconSizeToParentHeight
              : null,
          onPressed: () => onPressed(),
          icon: child,
        ),
      ),
    );
  }
}
