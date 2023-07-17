import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import '../../../core/constant/colors.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 15),
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
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.blue,
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
              color: AppColors.blueDark.withOpacity(.8),
              onSelected: (val) {
                if (val == 1) {
                  Get.defaultDialog(
                    cancelTextColor: AppColors.darkBlue,
                    confirmTextColor: AppColors.white,
                    buttonColor: AppColors.blue,
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
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    "حذف جميع الملاحظات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
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
