import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';

Future<bool> customAlertDialog(
    void Function()? onConfirm, void Function()? onCancel) {
  Get.defaultDialog(
    confirmTextColor: AppColors.spaceGrey,
    textConfirm: '15'.tr,
    textCancel: '16'.tr,
    title: '17'.tr,
    middleText: '18'.tr,
    onConfirm: onConfirm,
    onCancel: onCancel,
  );

  return Future.value(true);
}
