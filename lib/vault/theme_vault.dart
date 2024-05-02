import 'package:elibrary/style/app_colors.dart';
import 'package:elibrary/style/text_style.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

class ThemeValut{
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.dark0,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: AppColors.dark0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade800,
          width: 1.0,
        ),
        borderRadius:const BorderRadius.all(
          Radius.circular(UIParams.tinyBorderR),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: UIParams.sThick),
        borderRadius: const BorderRadius.all(Radius.circular(UIParams.tinyBorderR)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.silentBlue, width: UIParams.mThick),
        borderRadius: BorderRadius.all(Radius.circular(UIParams.tinyBorderR)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.thickRed, width: UIParams.mThick),
        borderRadius: BorderRadius.all(Radius.circular(UIParams.tinyBorderR)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.thickRed, width: UIParams.mThick),
        borderRadius: BorderRadius.all(Radius.circular(UIParams.tinyBorderR)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(UIParams.tinyBorderR)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: UIParams.sElevation,
        shadowColor: AppColors.darkgrey,
        backgroundColor: AppColors.silentBlue,
        disabledBackgroundColor: AppColors.silentBlue.withOpacity(UIParams.fadeFraction),
        disabledForegroundColor: Colors.grey,
        //padding
        textStyle: AppTextStyles.bodySmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIParams.smallBorderR),
        ),
      ),
    ),
  );
}