import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';
import 'package:notes_app_sqflite/core/services/services.dart';

class ThemeService {
  static ThemeData ligtTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Cairo",
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightGrey,
      secondary: AppColors.spaceGrey,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColors.blue),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Cairo",
    colorScheme: ColorScheme.dark(
      background: Color(0xff303030),
      primary: Color(0xff424242).withOpacity(.9),
      secondary: AppColors.lightGrey,
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
}
