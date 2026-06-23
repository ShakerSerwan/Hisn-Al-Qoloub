import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // ================= DARK THEME =================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Cairo',

    scaffoldBackgroundColor: AppColors.darkBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black87,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
    ),

    cardColor: AppColors.darkCard,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkPrimaryDark,
    ),
  );

  // ================= LIGHT THEME =================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Cairo',

    scaffoldBackgroundColor: AppColors.lightBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.lightPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.lightPrimary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),

    cardColor: AppColors.lightCard,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightPrimaryLight,
    ),
  );
}