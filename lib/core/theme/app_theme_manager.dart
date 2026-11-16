import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData getThemeData() => ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.gold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.gold,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.gold,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkBlue,
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlue,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.gold, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.gold, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.gold, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.gold,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBlue,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(16),
      ),
    ),
  );
}
