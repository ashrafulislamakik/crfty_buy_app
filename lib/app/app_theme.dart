import 'package:crfty_buy/app/app_colors.dart';
import 'package:flutter/material.dart';

class apptheme{

  static ThemeData _lightthemedata = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
        brightness: Brightness.light,
    progressIndicatorTheme: _circulerProgressIndicatorThemeData,
    scaffoldBackgroundColor: Colors.white
  );
  static ThemeData _darkthemedata = ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      brightness: Brightness.dark,
    progressIndicatorTheme: _circulerProgressIndicatorThemeData
  );

  static ProgressIndicatorThemeData get _circulerProgressIndicatorThemeData
  => ProgressIndicatorThemeData();

  static ThemeData get lightTheme => _lightthemedata;
  static ThemeData get darkTheme => _darkthemedata;
}