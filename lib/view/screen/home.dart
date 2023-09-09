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
import '../widget/shared/custom_floating_action_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: scaffoldKey,
      drawer: const Drawer(
        child: CustomDrawerHome(),
      ),
      floatingActionButton: CustomFloatingActionButton(
        text: '2'.tr,
        onPressed: () => Get.toNamed(AppRoutes.addNotes),
        // onPressed: () => controller.sqlDb.deleteDb(),
        widget: SizedBox(),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              CustomAppBarHome(
                onPressedDrawer: () => scaffoldKey.currentState!.openDrawer(),
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
