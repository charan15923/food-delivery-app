import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;

  // Grey
  static const grey_25 = Color(0xffFCFCFD);
  static const grey_50 = Color(0xFFF8F9FB);
  static const grey_100 = Color(0xffF2F4F7);
  static const grey_200 = Color(0xffEAECF0);
  static const grey_300 = Color(0xffD0D5DD);
  static const grey_400 = Color(0xff98A2B3);
  static const grey_500 = Color(0xff667085);
  static const grey_600 = Color(0xff475467);
  static const grey_700 = Color(0xff344054);
  static const grey_800 = Color(0xff1D2939);
  static const grey_900 = Color(0xff101828);

  static const filterBackground = Color(0xfff3f3f3);

  //gradient sets
  static const List<List<Color>> gradientColors = [
    [
      Color(0xFF87C6FE),
      Color(0xFFA8D8FF),
    ], // Light Blue to Light Sky Blue
    [
      Color(0xFF87C6FE),
      Color(0xFF87FECA),
    ], // Light Blue to Turquoise
    [Color(0xFFCBCAFF), Color(0xFFE4CAFF)], // Light Purple to Mauve
    [
      Color(0xFFCBCAFF),
      Color(0xFFFFCAFF),
    ], // Light Purple to Pink Lavender
    [
      Color(0xFF87C6FE),
      Color(0xFFFEA787),
    ], // Light Blue to Soft Peach
    [
      Color(0xFFCBCAFF),
      Color(0xFFCAFFCB),
    ], // Light Purple to Mint Green
    [
      Color(0xFF87C6FE),
      Color(0xFF87FE87),
    ], // Light Blue to Pale Green
    [
      Color(0xFFCBCAFF),
      Color(0xFFFFCACB),
    ], // Light Purple to Pale Pink
    [
      Color(0xFF87C6FE),
      Color(0xFF3784C2),
    ], // Light Blue to Medium Slate Blue
    [
      Color(0xFFCBCAFF),
      Color(0xFFE9E8FF),
    ], // Light Purple to Ghost White
  ];
}
