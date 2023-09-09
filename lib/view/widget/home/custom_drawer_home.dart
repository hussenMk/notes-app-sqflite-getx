import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/core/constant/functions/alert_exit_app.dart';
import 'package:notes_app_sqflite/core/constant/routes.dart';
import 'package:notes_app_sqflite/core/class/theme_data.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/image_asset.dart';
import '../../../core/localization/local_controller.dart';
import 'custom_button_lang.dart';

class CustomDrawerHome extends GetView<HomeController> {
  const CustomDrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());

    return Column(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.lightGrey,
            child: Image.asset(
              ImageAsset.logo,
              height: 50,
            ),
          ),
          accountName: const Text(
            "",
            style: TextStyle(color: AppColors.spaceGrey),
          ),
          accountEmail: const Text(
            "",
            style: TextStyle(color: AppColors.spaceGrey),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => ThemeService().changeThemeMode(),
                  child: ListTile(
                    title: Text('6'.tr),
                    leading: Image.asset(
                      ImageAsset.theme,
                      height: 30,
                    ),
                    // trailing: const Icon(CupertinoIcons.moon_stars),
                    trailing: GetBuilder<HomeController>(
                      builder: (controller) => Switch(
                        onChanged: (val) {
                          controller.switchChange(val);
                          ThemeService().changeThemeMode();
                        },
                        value: controller.isSwitch,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonLang(
                            txtButton: '11'.tr,
                            onPressed: () {
                              localeController.changeLang("ar");

                              Get.back();
                            },
                          ),
                          CustomButtonLang(
                            txtButton: '12'.tr,
                            onPressed: () {
                              localeController.changeLang("en");
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ));
                  },
                  title: Text('7'.tr),
                  leading: Image.asset(
                    ImageAsset.language,
                    height: 30,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.tsks);
                  },
                  title: Text('19'.tr),
                  leading: Image.asset(
                    ImageAsset.listToDo,
                    height: 30,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    launchUrlString("http://wa.me/+966543842700");
                  },
                  title: Text('8'.tr),
                  leading: Image.asset(
                    ImageAsset.help,
                    height: 30,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      height: 250,
                      child: Column(
                        children: [
                          Image.asset(
                            ImageAsset.logo,
                            height: 80,
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: const Text(
                              "تطبيق الملاحظات عبارة عن ...",
                            ),
                          ),
                        ],
                      ),
                    ));
                  },
                  title: Text('9'.tr),
                  leading: Image.asset(
                    ImageAsset.about,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              onTap: () => alertExitApp(),
              title: Text(
                '10'.tr,
                style: const TextStyle(color: AppColors.red),
              ),
              leading: Image.asset(
                ImageAsset.logout,
                height: 25,
                color: AppColors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
