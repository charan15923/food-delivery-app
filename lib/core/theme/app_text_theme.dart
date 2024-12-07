import 'package:flutter/material.dart';

import '../assets/fonts.gen.dart';
import '../utils/ui_dimensions.dart';
import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextStyle _textTheme = TextStyle(
    fontFamily: AppFonts.sfpro,
    color: AppColors.black,
    fontFeatures: [FontFeature.stylisticSet(1)],
    decoration: TextDecoration.none,
  );

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _textTheme.copyWith(
      fontSize: UIDimensions.font32,
    ),
    displayMedium: _textTheme.copyWith(
      fontSize: UIDimensions.font28,
    ),
    headlineLarge: _textTheme.copyWith(
      fontSize: UIDimensions.font24,
    ),
    headlineMedium: _textTheme.copyWith(
      fontSize: UIDimensions.font20,
    ),
    headlineSmall: _textTheme.copyWith(
      fontSize: UIDimensions.font18,
    ),
    titleLarge: _textTheme.copyWith(
      fontSize: UIDimensions.font16,
    ),
    titleMedium: _textTheme.copyWith(
      fontSize: UIDimensions.font14,
    ),
    titleSmall: _textTheme.copyWith(
      fontSize: UIDimensions.font12,
    ),
    bodyLarge: _textTheme.copyWith(
      fontSize: UIDimensions.font16,
    ),
    bodyMedium: _textTheme.copyWith(
      fontSize: UIDimensions.font14,
    ),
    bodySmall: _textTheme.copyWith(
      fontSize: UIDimensions.font12,
    ),
    labelLarge: _textTheme.copyWith(
      fontSize: UIDimensions.font16,
    ),
    labelMedium: _textTheme.copyWith(
      fontSize: UIDimensions.font14,
    ),
    labelSmall: _textTheme.copyWith(
      fontSize: UIDimensions.font12,
    ),
  );
}
