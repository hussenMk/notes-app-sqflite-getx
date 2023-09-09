import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/tasks_controller.dart';

class CustomTextFieldTasks extends GetView<TasksController> {
  const CustomTextFieldTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.title,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "ابدأ بكتابة مهمتك  📝",
      ),
    );
  }
}
