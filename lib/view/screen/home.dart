import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import 'package:notes_app_sqflite/core/class/search_delegate.dart';
import 'package:notes_app_sqflite/core/constant/routes.dart';
import '../../core/constant/functions/alert_exit_app.dart';
import '../widget/home/card_notes.dart';
import '../widget/home/custom_app_bar_home.dart';
import '../widget/home/custom_drawer_home.dart';
import '../widget/home/custom_welcome.dart';

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
