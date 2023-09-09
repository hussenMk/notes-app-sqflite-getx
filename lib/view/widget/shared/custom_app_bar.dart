import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/edit_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/functions/custom_alert_dialog_delete.dart';

class CustomAppBarEdit extends GetView<EditNotesController> {
  const CustomAppBarEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Share.share(
                        "عنوان الملاحظة : ${controller.title!.text} \n المحتوى : ${controller.content!.text}");
                  },
                  icon: const Icon(Icons.share),
                  color: AppColors.blue2,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    customAlertDialogDelete(
                      () {
                        Get.back();
                        controller.deleteData(controller.id!);
                      },
                      () {},
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
