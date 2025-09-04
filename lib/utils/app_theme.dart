import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.black,
      selectedItemColor: AppColors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
      textTheme: TextTheme(
      )
  );
}
