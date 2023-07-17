import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_sqflite/core/class/sqldb.dart';
import '../core/constant/colors.dart';
import '../core/constant/routes.dart';
import 'home_controller.dart';

class EditNotesController extends GetxController {
  SqlDb sqlDb = SqlDb();
  int? id;
  List data = [];
  TextEditingController? title;
  TextEditingController? content;
  String dateTimeCreated =
      DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now());

  Future updateData(int id) async {
    int response = await sqlDb.updateData(
      "notes",
      {
        "title": title!.text,
        "content": content!.text,
        "dateTimeCreated": dateTimeCreated,
      },
      "id = $id",
    );

    if (response > 0) {
      Get.snackbar(
        "تنبيه",
        "تم تعديل الملاحظة بنجاح",
        colorText: AppColors.primaryColor,
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

  Future deleteData(int id) async {
    int response = await sqlDb.deleteData("notes", "id = $id");

    if (response > 0) {
      data.removeWhere((element) => element['id'] == id);
      update();
      Get.snackbar("تنبيه", "تم حذف الملاحظة بنجاح",
          colorText: AppColors.primaryColor);
      Get.offNamed(AppRoutes.home);
      HomeController c = Get.put(HomeController());
      c.readData();
    } else {
      Get.snackbar("تنبيه", "حصل خطأ");
    }
    update();
    return data;
  }

  @override
  void onInit() {
    title = TextEditingController();
    content = TextEditingController();
    id = Get.arguments['id'];
    title!.text = Get.arguments['title'];
    content!.text = Get.arguments['content'];
    super.onInit();
  }
}
