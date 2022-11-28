import 'package:flutter/material.dart';

import 'pages/profile_page.dart';
import 'pages/splash_screen.dart';
import 'utils/constants.dart';
import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getAppVersion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      darkTheme: appDarkTheme(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: {
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
