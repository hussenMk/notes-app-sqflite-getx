import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/class/sqldb.dart';

class TasksController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SqlDb sqlDb = SqlDb();
  List data = [];
  TextEditingController? title;
  bool isChekced = false;

  void checkBoxChanged(bool? val) {
    isChekced = val!;
    update();
  }

  Future readData() async {
    List<Map> response = await sqlDb.readData("tasks");
    data.clear();
    data.addAll(response);

    update();
  }

  Future deleteAllData() async {
    int response = await sqlDb.deleteAllData("tasks");

    if (response > 0) {
      data.remove((element) => element);
      update();

      TasksController c = Get.put(TasksController());
      c.readData();

      print("$reactive ==========DELETE ALL DATA========");
    } else {}
    update();
    return data;
  }

  Future deleteData(int id) async {
    int response = await sqlDb.deleteData("tasks", "id = $id");

    if (response > 0) {
      data.removeWhere((element) => element['id'] == id);
      update();

      TasksController c = Get.put(TasksController());
      c.readData();
    } else {
      Get.snackbar("تنبيه", "حصل خطأ");
    }
    update();
    return data;
  }

  Future insertData() async {
    int response = await sqlDb.insertData(
      "tasks",
      {
        "title": title!.text,
        "isDone": isChekced,
      },
    );

    if (response > 0) {
      TasksController c = Get.put(TasksController());
      title!.clear();
      update();
      c.readData();
    } else {
      Get.snackbar("تنبيه", "حصل خطأ");
    }
    update();
    print(response);
    return response;
  }

  Future updateData(bool? newValue, String id) async {
    int response = await sqlDb.updateData(
      "tasks",
      {
        "isDone": newValue,
      },
      "id = $id",
    );
    update();

    if (response > 0) {
      TasksController c = Get.put(TasksController());
      title!.clear();
      update();
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
    readData();
    title = TextEditingController();
    super.onInit();
  }
}
