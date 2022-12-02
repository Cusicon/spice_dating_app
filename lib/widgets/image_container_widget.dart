import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imageUrl,
    this.height = 0.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      placeholder: (context, url) => ShimmerContainer(height: height),
      errorWidget: (context, url, error) => ShimmerContainerError(
        height: height,
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: appLoadingBackgroundColor,
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: appLoadingBackgroundColor,
        ),
      ),
    );
  }
}

class ShimmerContainerError extends StatelessWidget {
  const ShimmerContainerError({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: appLoadingBackgroundColor,
      ),
      child: SizedBox(
        height: height,
        child: Center(
          child: Icon(
            LineIcons.times,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
