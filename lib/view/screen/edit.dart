import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/edit_controller.dart';
import '../../../../core/constant/colors.dart';
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
        backgroundColor: AppColors.blue,
        label: const Text(
          "حفظ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.save),
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
                  Get.defaultDialog(
                    cancelTextColor: AppColors.darkBlue,
                    confirmTextColor: AppColors.white,
                    buttonColor: AppColors.blue,
                    title: "تنبيه",
                    middleText: "هل أنت متأكد من حذف الملاحظة؟",
                    onConfirm: () {
                      Get.back();
                      controller.deleteData(controller.id!);
                    },
                    onCancel: () {},
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
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              TextFormField(
                controller: controller.title,
                // maxLength: 100,
                decoration: InputDecoration(
                    hintText: 'العنوان',
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    border: InputBorder.none),
                style: const TextStyle(
                  fontSize: 25.0,
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: AppColors.blue,
                // validator: (val) => validInput(val!, 1, 20, ""),
              ),
              Table(
                children: [
                  const TableRow(
                    children: [
                      Text(
                        "عدد الحروف",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue2),
                      ),
                      Text(
                        "عدد الكلمات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue2),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        "${controller.content!.text.length}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue),
                      ),
                      Text(
                        "${controller.title!.text.length}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(indent: 20, endIndent: 20),
              TextFormField(
                style: const TextStyle(color: AppColors.blue),
                controller: controller.content,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'ابدأ في الكتابة',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: AppColors.blue,
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
