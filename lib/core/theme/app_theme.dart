import 'package:flutter/material.dart';

import '../assets/fonts.gen.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.sfpro,
    brightness: Brightness.light,
    primaryColor: Colors.white,
  );
}
