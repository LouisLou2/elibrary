import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';


class ColorGroup{
  final Color backC;
  final Color foreC;
  final Color hoverC;
  const ColorGroup({
    required this.backC,
    required this.foreC,
    required this.hoverC,
  });
}

class AppTextStyles {
  static const String defFontFamily = "NotoSansSC";
  static const iconTextStyle = TextStyle(
    fontFamily: defFontFamily,
    fontSize: 20,
    letterSpacing: 0.5,
  );
  static const TextStyle titleLarge = TextStyle(
    fontFamily: defFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 34,
    letterSpacing: 0.5,
  );
  static const titleMedium = TextStyle(
    fontFamily: defFontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 25,
    letterSpacing: 0.5,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: defFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: 0.6,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: defFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.6,
  );
  static const TextStyle tinyText = TextStyle(
    fontFamily: defFontFamily,
    fontSize: 13.5,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static const TextStyle microText = TextStyle(
    fontFamily: defFontFamily,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static const TextStyle textBtnOrLinkStyle = TextStyle(
    fontFamily: defFontFamily,
    fontSize: 20,
    letterSpacing: 0.5,
  );
}