import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/localization/translation.dart';
import 'package:notes_app_sqflite/routes.dart';
import 'package:notes_app_sqflite/theme/theme.dart';

import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      theme: ThemeService.ligtTheme,
      darkTheme: ThemeService.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      getPages: routes,
    );
  }
}
