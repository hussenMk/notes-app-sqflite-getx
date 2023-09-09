import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/edit_controller.dart';
import '../widget/shared/custom_app_bar.dart';
import '../widget/shared/custom_floating_action_button.dart';
import '../widget/shared/custom_text_form_field_content.dart';
import '../widget/shared/custom_text_form_field_title.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    EditNotesController controller = Get.put(EditNotesController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: CustomFloatingActionButton(
        text: '3'.tr,
        onPressed: () => controller.updateData(controller.id!),
        widget: Icon(
          Icons.save,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: GetBuilder<EditNotesController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomAppBarEdit(),
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
