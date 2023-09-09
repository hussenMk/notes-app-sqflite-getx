import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/tasks_controller.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';

class CustomAppBarTasks extends GetView<TasksController> {
  const CustomAppBarTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.blue,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    // color: Theme.of(context).colorScheme.,
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: PopupMenuButton(
              color: Theme.of(context).colorScheme.onSecondary,
              onSelected: (val) {
                if (val == 1) {
                  Get.defaultDialog(
                    cancelTextColor: Theme.of(context).colorScheme.secondary,
                    confirmTextColor: Theme.of(context).colorScheme.primary,
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    title: "تنبيه",
                    middleText: "هل أنت متأكد من حذف جميع المهام ؟",
                    onConfirm: () {
                      Get.back();
                      controller.deleteAllData();
                    },
                    onCancel: () {},
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'حذف جميع المهام'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search
        ],
      ),
    );
  }
}
