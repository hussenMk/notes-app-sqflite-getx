import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';
import '../../../core/constant/image_asset.dart';

class CustomAppBarHome extends GetView<HomeController> {
  final void Function()? onPressedDrawer;
  final void Function()? onPressedSearch;

  const CustomAppBarHome({
    Key? key,
    this.onPressedDrawer,
    this.onPressedSearch,
  }) : super(key: key);

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
                  onPressed: onPressedDrawer,
                  icon: Image.asset(
                    ImageAsset.drawer,
                    //! color: Theme.of(context).colorScheme.secondary,
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
                  onPressed: onPressedSearch,
                  icon: Icon(
                    Icons.search,
                    //! color: Theme.of(context).colorScheme.secondary,
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
                    middleText: "هل أنت متأكد من حذف جميع الملاحظات ؟",
                    onConfirm: () {
                      controller.deleteAllData();

                      Get.back();
                    },
                    onCancel: () {},
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    '13'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 13,
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
