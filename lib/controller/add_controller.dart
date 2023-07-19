import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';
import 'package:notes_app_sqflite/core/constant/routes.dart';
import 'package:notes_app_sqflite/core/class/sqldb.dart';

class AddNotesController extends GetxController {
  SqlDb sqlDb = SqlDb();
  TextEditingController? title;
  TextEditingController? content;
  String dateTimeCreated =
      DateFormat("MMM dd, yyyy HH:mm").format(DateTime.now());

  Future insertData() async {
    int response = await sqlDb.insertData(
      "notes",
      {
        "title": title!.text,
        "content": content!.text,
        "dateTimeCreated": dateTimeCreated,
      },
    );

    if (response > 0) {
      Get.snackbar(
        "تنبيه",
        "تم إضافة الملاحظة بنجاح",
        colorText: AppColors.spaceGrey,
      );

      Get.offNamed(AppRoutes.home);
      HomeController c = Get.put(HomeController());
      c.readData();
    } else {
      Get.snackbar("تنبيه", "حصل خطأ");
    }
    update();
    print(response);
    return response;
  }

  @override
  void onInit() {
    title = TextEditingController();
    content = TextEditingController();
    super.onInit();
  }
}
