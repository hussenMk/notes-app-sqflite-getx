import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/add_controller.dart';
import '../../core/services/add_notes/custom_app_bar_add.dart';
import '../widget/shared/custom_floating_action_button.dart';
import '../widget/shared/custom_text_form_field_content.dart';
import '../widget/shared/custom_text_form_field_title.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    AddNotesController controller = Get.put(AddNotesController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: CustomFloatingActionButton(
        text: '3'.tr,
        onPressed: () => controller.insertData(),
        widget: Icon(
          Icons.save,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: GetBuilder<AddNotesController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              CustomAppBarAdd(),
              CustomTextFormFieldTitle(
                controller: controller.title!,
              ),
              const Divider(indent: 20, endIndent: 20),
              CustomTextFormFieldContent(
                controller: controller.content!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
