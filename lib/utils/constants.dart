// import 'package:flutter/material.dart';
// import 'package:palette_generator/palette_generator.dart';
import 'package:package_info_plus/package_info_plus.dart';

const double pagePaddingSize = 24.0;
const double minPaddingSize = 8.0;
const double maxSizedBox = 16.0;
const double borderRadius = 24.0;
const double minSizedBox = 8.0;

const String appTitle = 'Spice';
const String appSubTitle = 'Social Media Network';
const String appLaunchScreenLogo = 'assets/icons/launchscreen-logo.png';
const String appLogo = 'assets/icons/text-logo.png';

String appName = '';
String packageName = '';
String appVersion = '';
String buildNumber = '';

Future<void> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appName = packageInfo.appName;
  packageName = packageInfo.packageName;
  appVersion = packageInfo.version;
  buildNumber = packageInfo.buildNumber;
}



// Future<PaletteColor> generatePalette(
//   String imagePath,
// ) async {
//   PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
//     NetworkImage(imagePath),
//     size: const Size(100, 150),
//     maximumColorCount: 20,
//   );

//   return paletteGenerator.dominantColor!;
// }
