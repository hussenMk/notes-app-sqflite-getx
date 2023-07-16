import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/sqldb.dart';
import '../core/constant/colors.dart';
import '../core/constant/routes.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SqlDb sqlDb = SqlDb();

  List data = [];

  Future readData() async {
    List<Map> response = await sqlDb.readData("notes");
    data.clear();
    data.addAll(response);
    update();
  }

  Future deleteAllData() async {
    int response = await sqlDb.deleteAllData("notes");

    if (response > 0) {
      data.remove((element) => element);
      update();
      Get.snackbar("تنبيه", "تم حذف جميع الملاحظات بنجاح",
          colorText: AppColors.blue);
      HomeController c = Get.put(HomeController());
      c.readData();

      print("$reactive ==========DELETE ALL DATA========");
    } else {
      Get.snackbar("تنبيه", "حصل خطأ");
    }
    update();
    return data;
  }

  @override
  void onInit() {
    readData();
    super.onInit();
  }

  goToEditNotes(int id, String title, content, dateTimeCreated) {
    Get.toNamed(AppRoutes.editNotes, arguments: {
      "id": id,
      "title": title,
      "content": content,
      "dateTimeCreated": dateTimeCreated,
    });
  }
}
