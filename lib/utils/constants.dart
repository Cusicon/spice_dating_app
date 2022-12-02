import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/user_model.dart';
import '../pages/profile_page.dart';

const double pagePaddingSize = 24.0;
const double minPaddingSize = 8.0;
const double maxSizedBox = 16.0;
const double minSizedBox = 8.0;
const double borderWidth = 2.0;
const double borderRadius = 16.0;

const String appTitle = 'Spice';
const String appSubTitle = '...Kings to Queens only';
const String appLaunchScreenLogo = 'assets/icons/launchscreen-logo.png';
const String appIcon = 'assets/icons/icon.png';
const String appLogo = 'assets/icons/text-logo.png';
const String loveIcon = 'assets/lottieicons/love-icon.json';
const String loveHearts = 'assets/lottieicons/love-hearts.json';
const String loveWithParticle = 'assets/lottieicons/love-with-particle.json';
const String loveFloating = 'assets/lottieicons/love-floating.json';

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

void showProfileModal(BuildContext context, User user) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 0.85,
        builder: (_, scrollController) => ClipRRect(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(borderRadius),
            right: Radius.circular(borderRadius),
          ),
          child: ProfilePage(
            scrollController: scrollController,
            user: user,
          ),
        ),
      );
    },
  );
}

// void darkModeInitializer() {
//   var brightness =
//       SchedulerBinding.instance.platformDispatcher.platformBrightness;
//   brightness == Brightness.dark;
//   appLaunchScreenLogo = 'assets/icons/launchscreen-logo.png';
//   appIcon = 'assets/icons/dark/icon-dark.png';
//   appLogo = 'assets/icons/dark/text-logo-dark.png';
// }

Future<PaletteColor> generatePalette(
  String imagePath,
) async {
  PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
    NetworkImage(imagePath),
    size: const Size(100, 150),
    maximumColorCount: 20,
  );

  return paletteGenerator.dominantColor!;
}
