import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import 'package:notes_app_sqflite/core/class/search_delegate.dart';
import 'package:notes_app_sqflite/core/constant/image_asset.dart';
import 'package:notes_app_sqflite/core/constant/routes.dart';
import 'package:notes_app_sqflite/view/widget/shared/custom_app_bar.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/functions/alert_exit_app.dart';
import '../../widget/home/card_notes.dart';
import '../../widget/home/custom_app_bar_home.dart';
import '../../widget/home/custom_drawer_home.dart';
import '../../widget/home/custom_welcome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: controller.scaffoldKey,
      drawer: const Drawer(
        child: CustomDrawerHome(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppRoutes.addNotes);
        },
        // backgroundColor: AppColors.blue,
        label: Text(
          "إضافة ملاحظة",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              CustomAppBarHome(
                onPressedDrawer: () =>
                    controller.scaffoldKey.currentState?.openDrawer(),
                onPressedSearch: () => showSearch(
                  context: (context),
                  delegate: SearchData(),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<HomeController>(
                builder: (controller) => controller.data.isEmpty
                    ? const CustomWelcomeScreen()
                    : const CustomCardNotes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








  // CustomAppBar(
  //               onPressedRight: () {
  //                 showSearch(
  //                   context: (context),
  //                   delegate: SearchData(),
  //                 );
  //               },
  //               onPressedLeft: () => controller.sqlDb.deleteDb(),
  //               iconRight: const Icon(
  //                 Icons.search,
  //                 color: AppColors.blue,
  //               ),
  //               iconLeft: const Icon(
  //                 Icons.delete,
  //                 color: AppColors.red,
  //               ),
  //               widget: Container(
  //                 decoration: BoxDecoration(
  //                   color: AppColors.lightGrey,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: PopupMenuButton(
  //                   color: AppColors.blue,
  //                   onSelected: (val) {
  //                     if (val == 0) {
  //                       Get.defaultDialog(
  //                         cancelTextColor: AppColors.darkBlue,
  //                         confirmTextColor: AppColors.white,
  //                         buttonColor: AppColors.blue,
  //                         title: "تنبيه",
  //                         middleText: "هل أنت متأكد من حذف جميع الملاحظات ؟",
  //                         onConfirm: () {
  //                           Get.back();
  //                           // controller.deleteData(controller.id!);
  //                         },
  //                         onCancel: () {},
  //                       );
  //                     }
  //                   },
  //                   itemBuilder: (context) => [
  //                     PopupMenuItem(
  //                       value: 0,
  //                       child: const Text(
  //                         "حذف جميع الملاحظات",
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       onTap: () => print("=================="),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),