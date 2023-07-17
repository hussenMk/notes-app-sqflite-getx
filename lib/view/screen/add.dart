import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/add_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/functions/valid_input.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    AddNotesController controller = Get.put(AddNotesController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.insertData(),
        label: const Text(
          "حفظ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        icon: const Icon(
          Icons.save,
          color: AppColors.white,
        ),
      ),
      body: GetBuilder<AddNotesController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: controller.title,
                decoration: InputDecoration(
                  hintText: 'العنوان',
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,
              ),
              const Divider(indent: 20, endIndent: 20),
              TextFormField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                controller: controller.content,
                maxLines: null,
                maxLength: 500,
                decoration: InputDecoration(
                  hintText: 'ابدأ في الكتابة',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
