import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق ؟",
    actions: [
      MaterialButton(
          color: AppColors.primaryColor,
          textColor: AppColors.white,
          onPressed: () {
            exit(0);
          },
          child: const Text("موافق")),
      MaterialButton(
          color: AppColors.darkRed,
          textColor: AppColors.white,
          onPressed: () {
            Get.back();
          },
          child: const Text("إلغاء")),
    ],
  );
  return Future.value(true);
}
