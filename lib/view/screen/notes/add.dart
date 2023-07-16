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
        backgroundColor: AppColors.blue,
        label: const Text(
          "حفظ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.save),
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
                // maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'العنوان',
                  hintStyle: TextStyle(
                      fontSize: 22, color: AppColors.blue.withOpacity(0.6)),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),

                cursorColor: AppColors.blue,
                validator: (val) => validInput(val!, 1, 20, ""),
              ),
              // !Text(
              //   controller.dateTimeCreated,
              //   style: const TextStyle(
              //     color: AppColors.blue2,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const Divider(indent: 20, endIndent: 20),
              TextFormField(
                style: const TextStyle(color: AppColors.blue),
                controller: controller.content,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'ابدأ في الكتابة',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: AppColors.blue.withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: AppColors.blue,
                validator: (val) => validInput(val!, 3, 300, ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
