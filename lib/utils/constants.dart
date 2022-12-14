import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/user_model.dart';
import '../pages/profile_page.dart';

const double pagePaddingSize = 24.0;
const double minPaddingSize = 8.0;
const double maxSizedBox = 16.0;
const double minSizedBox = 8.0;
const double borderWidth = 2.0;
const double containerBorderRadius = 16.0;

const String appTitle = 'Spice';
const String appSubTitle = '...Kings to Queens only';
const String loveIcon = 'assets/lottieicons/love-icon.json';
const String loveHearts = 'assets/lottieicons/love-hearts.json';
const String loveWithParticle = 'assets/lottieicons/love-with-particle.json';
const String loveFloating = 'assets/lottieicons/love-floating.json';

String appLaunchScreenLogo = 'assets/icons/launchscreen-logo.png';
String appIcon = 'assets/icons/icon.png';
String appLogo = 'assets/icons/text-logo.png';

// void goFullscreen() {
//   // SystemChrome.setEnabledSystemUIMode(overlays: []);
// }

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

void showProfileModal(BuildContext context, User user) async {
  PaletteColor paletteColor = await generatePalette(user.photos.first);

  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    barrierColor: paletteColor.color,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.6,
        snap: true,
        builder: (_, scrollController) => ProfilePage(
          scrollController: scrollController,
          user: user,
        ),
      );
    },
  );
}

void darkModeInitializer(BuildContext context) {
  // var brightness =
  //     SchedulerBinding.instance.platformDispatcher.platformBrightness;

  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  if (isDarkMode) {
    appLaunchScreenLogo = 'assets/icons/launchscreen-logo.png';
    appIcon = 'assets/icons/dark/icon-dark.png';
    appLogo = 'assets/icons/dark/text-logo-dark.png';
  }
}

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
