import 'dart:io';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    confirmTextColor: AppColors.spaceGrey,
    textConfirm: '15'.tr,
    textCancel: '16'.tr,
    title: '17'.tr,
    middleText: 'هل تريد الخروج من التطبيق ؟'.tr,
    onConfirm: () {
      exit(0);
    },
    onCancel: () {
      Get.back();
    },
  );

  return Future.value(true);
}
