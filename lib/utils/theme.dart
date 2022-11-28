import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.questrial().fontFamily,
    primarySwatch: createMaterialColor(const Color(appPrimaryColor)),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        height: 1.5,
      ),
    ),
  );
}

ThemeData appDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.questrial().fontFamily,
    scaffoldBackgroundColor: Colors.transparent,
    primarySwatch: createMaterialColor(const Color(appPrimaryColor)),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        height: 1.5,
      ),
    ).apply(
      bodyColor: Colors.grey.shade400,
      displayColor: Colors.red,
    ),
  );
}
