import 'package:flutter/material.dart';

import 'configs/colors.dart';

class AppTheme {
  final BuildContext context;

  static const String fontFamily = 'nunito';
  static const Color textColor = AppColors.fontColor;

  AppTheme({
    required this.context,
  });

  static final lightTheme = ThemeData(
    primaryColor: AppColors.orange100,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.orange100,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50.0),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey40;
            }

            return AppColors.orange100;
          },
        ),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.orange100,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
      ),
    ),
  );
}
