import 'package:flutter/material.dart';

class gradients{
  static const Gradient login=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
   colors: [
    Color.fromARGB(220, 9, 17, 112), // Very Dark Gray
    Color.fromARGB(255, 6, 0, 28),
    ]);
}
class AppColors {
  // Common colors
  static const Color primary = Colors.blue;

  // Light mode specific colors
  static const Color lightPrimary = Colors.blue;
  static const Color lightPrimaryVariant = Colors.blueAccent;
  static const Color lightSecondary = Colors.lightBlue;
  static const Color lightSecondaryVariant = Colors.lightBlueAccent;
  static const Color lightBackground = Colors.white;
  static const Color lightSurface = Colors.white;
  static const Color lightError = Colors.red;
  static const Color lightOnPrimary = Colors.white;
  static const Color lightOnSecondary = Colors.black;
  static const Color lightOnBackground = Colors.black;
  static const Color lightOnSurface = Colors.black;
  static const Color lightOnError = Colors.white;

  // Dark mode specific colors
  static const Color darkPrimary = Colors.blue;
  static const Color darkPrimaryVariant = Colors.blueAccent;
  static const Color darkSecondary = Color.fromARGB(255, 1, 9, 62);
  static const Color darkSecondaryVariant = Colors.lightBlueAccent;
  static const Color darkBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color darkSurface = Colors.black;
  static const Color darkError = Colors.red;
  static const Color darkOnPrimary = Colors.black;
  static const Color darkOnSecondary = Colors.white;
  static const Color darkOnBackground = Colors.white;
  static const Color darkOnSurface = Colors.white;
  static const Color darkOnError = Colors.black;
}



class appthemes {
  static final ThemeData lighttheme = ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.lightPrimary,
      primaryContainer: AppColors.lightPrimaryVariant,
      secondary: AppColors.lightSecondary,
      secondaryContainer: AppColors.lightSecondaryVariant,
      surface: AppColors.lightSurface,
      background: AppColors.lightBackground,
      error: AppColors.lightError,
      onPrimary: AppColors.lightOnPrimary,
      onSecondary: AppColors.lightOnSecondary,
      onSurface: AppColors.lightOnSurface,
      onBackground: AppColors.lightOnBackground,
      onError: AppColors.lightOnError,
      brightness: Brightness.light,

    ),
  );

  static final ThemeData darktheme = ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.darkPrimary,
      primaryContainer: AppColors.darkPrimaryVariant,
      secondary: AppColors.darkSecondary,
      secondaryContainer: AppColors.darkSecondaryVariant,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      error: AppColors.darkError,
      onPrimary: AppColors.darkOnPrimary,
      onSecondary: AppColors.darkOnSecondary,
      onSurface: AppColors.darkOnSurface,
      onBackground: AppColors.darkOnBackground,
      onError: AppColors.darkOnError,
      brightness: Brightness.dark,
    ),
  );
}
