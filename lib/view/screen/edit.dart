import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/edit_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../core/constant/functions/custom_alert_dialog.dart';
import '../widget/shared/custom_app_bar.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    EditNotesController controller = Get.put(EditNotesController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.updateData(controller.id!);
        },
        label: Text(
          '3'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        icon: const Icon(
          Icons.save,
          color: AppColors.white,
        ),
      ),
      body: GetBuilder<EditNotesController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomAppBar(
                onPressedRight: () => Get.back(),
                onPressedLeft: () {
                  customAlertDialog(
                    () {
                      Get.back();
                      controller.deleteData(controller.id!);
                    },
                    () {},
                  );
                },
                iconLeft: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                ),
                iconRight: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                widget: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      //! Share.share("${controller.title.obs} \n${controller.content}");
                    },
                    icon: const Icon(Icons.share),
                    // color: Theme.of(context).colorScheme.secondary,
                    color: AppColors.blue2,
                  ),
                ),
              ),
              TextFormField(
                controller: controller.title,
                // maxLength: 100,
                decoration: InputDecoration(
                    hintText: '4'.tr,
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    border: InputBorder.none),
                style: TextStyle(
                  fontSize: 23.0,
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
                  hintText: '5'.tr,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,

                // validator: (val) => validInput(val!, 3, 200, ""),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
