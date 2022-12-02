import 'package:flutter/material.dart';

import 'pages/home_page.dart';
// import 'pages/profile_page.dart';
import 'utils/constants.dart';
import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // darkModeInitializer();
  await getAppVersion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      darkTheme: appDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   // ProfilePage.routeName: (context) => const ProfilePage(),
      // },
    );
  }
}
