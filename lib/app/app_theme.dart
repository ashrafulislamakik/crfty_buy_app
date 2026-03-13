import 'package:crfty_buy/app/app_colors.dart';
import 'package:flutter/material.dart';

class apptheme{

  static ThemeData _lightthemedata = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
        brightness: Brightness.light,
    progressIndicatorTheme: _circulerProgressIndicatorThemeData,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme,
      inputDecorationTheme: _inputDecoration,
      filledButtonTheme: _filledbuttonthemedata
  );
  static ThemeData _darkthemedata = ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      brightness: Brightness.dark,
      progressIndicatorTheme: _circulerProgressIndicatorThemeData,
      textTheme: _textTheme,
    inputDecorationTheme: _inputDecoration,
    filledButtonTheme: _filledbuttonthemedata
  );

  static ProgressIndicatorThemeData get _circulerProgressIndicatorThemeData
  => ProgressIndicatorThemeData();

  static TextTheme get _textTheme{
    return TextTheme( titleLarge: TextStyle(fontWeight: FontWeight.w700));
  }

  static ThemeData get lightTheme => _lightthemedata;
  static ThemeData get darkTheme => _darkthemedata;

  static InputDecorationTheme get _inputDecoration {
    return
      InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor),
          borderRadius: BorderRadius.circular(8)
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor),
          borderRadius: BorderRadius.circular(8)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor),
          borderRadius: BorderRadius.circular(8)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }


  static FilledButtonThemeData get _filledbuttonthemedata {
    return FilledButtonThemeData (
        style: FilledButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: AppColors.themeColor
        ),
    );
  }
}