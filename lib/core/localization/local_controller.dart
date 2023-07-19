import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/theme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  bool isSwitch = false;
  MyServices myServices = Get.find();

  ThemeData appTheme = ThemeService.themeArabic;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme =
        langCode == "ar" ? ThemeService.themeArabic : ThemeService.themeEnglish;
    Get.updateLocale(locale);
  }

  changeSwitchTheme(val) {
    isSwitch = val;
    update();
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = ThemeService.themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = ThemeService.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
