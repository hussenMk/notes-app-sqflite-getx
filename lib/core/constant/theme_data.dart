// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../services/services.dart';

// MyServices myServices = Get.find();

// class ThemeService {
//   static ThemeData ligtTheme = ThemeData.light().copyWith();
//   static ThemeData darkTheme = ThemeData.dark().copyWith();
//   final darkThemeKey = "isDarkTheme";

//   void saveThemeData(bool isDarkMode) {
//     myServices.sharedPreferences.setBool(darkThemeKey, isDarkMode);
//   }

//   bool isSaveDarkMode() {
//     return myServices.sharedPreferences.getBool(darkThemeKey) ?? false;
//   }

//   ThemeMode getThemeMode() {
//     return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
//   }

//   void changeTheme() {
//     Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark);
//     saveThemeData(!isSaveDarkMode());
//   }

//   static ThemeData themeArabic = ThemeData(
//     fontFamily: "Cairo",
//   );

//   static ThemeData themeEnglish = ThemeData(
//     fontFamily: "Roboto",
//   );
// }
