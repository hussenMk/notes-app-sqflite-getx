import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';
import 'package:notes_app_sqflite/core/services/services.dart';

class ThemeService {
  static ThemeData ligtTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Cairo",
    cardColor: AppColors.lightGrey,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightGrey,
      secondary: AppColors.spaceGrey,
      tertiary: AppColors.primaryColor,
      onPrimary: const Color.fromARGB(159, 0, 0, 0),
      onSecondary: AppColors.spaceGrey.withOpacity(.6),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.spaceGrey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Cairo",
    colorScheme: ColorScheme.dark(
      background: const Color(0xff303030),
      primary: const Color(0xff424242).withOpacity(.9),
      secondary: AppColors.lightGrey,
      tertiary: AppColors.lightGrey,
      onPrimary: const Color.fromARGB(255, 151, 151, 151).withOpacity(.9),
      onSecondary: AppColors.lightGrey3,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightGrey),
  );

  MyServices myServices = Get.find();
  final darkThemeKey = "isDarkTheme";

  void saveThemeData(bool isDarkMode) {
    myServices.sharedPreferences.setBool(darkThemeKey, isDarkMode);
  }

  bool isSaveDarkMode() {
    return myServices.sharedPreferences.getBool(darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSaveDarkMode());
  }

  static ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
  );

  static ThemeData themeEnglish = ThemeData(
    fontFamily: "Roboto",
  );
}
