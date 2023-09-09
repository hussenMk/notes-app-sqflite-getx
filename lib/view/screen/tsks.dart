import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/tasks_controller.dart';
import 'package:notes_app_sqflite/view/widget/home/custom_welcome.dart';
import '../widget/shared/custom_floating_action_button.dart';
import '../widget/tasks/custom_app_bar_tasks.dart';
import '../widget/tasks/custom_list_view_tasks.dart';
import '../widget/tasks/custom_text_field_tasks.dart';

class Tsks extends GetView<TasksController> {
  Tsks({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TasksController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: CustomFloatingActionButton(
        text: '21'.tr,
        onPressed: () {
          Get.defaultDialog(
            barrierDismissible: false,
            title: '20'.tr,
            content: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: CustomTextFieldTasks(),
            ),
            onConfirm: () {
              Get.back();
              controller.insertData();
            },
            onCancel: () {},
            textConfirm: "حفظ",
            textCancel: "إالغاء",
            cancelTextColor: Theme.of(context).colorScheme.secondary,
            confirmTextColor: Theme.of(context).colorScheme.primary,
            buttonColor: Theme.of(context).colorScheme.secondary,
          );
        },
        widget: SizedBox(),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CustomAppBarTasks(),
              SizedBox(height: 30),
              GetBuilder<TasksController>(
                builder: (controller) => controller.data.isEmpty
                    ? const CustomWelcomeScreen()
                    : CustomListViewTasks(),
              ),
            ],
          )),
    );
  }
}
