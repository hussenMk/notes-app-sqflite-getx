import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/functions/custom_alert_dialog.dart';

class CustomCardNotes extends GetView<HomeController> {
  const CustomCardNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        itemCount: controller.data.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => controller.goToEditNotes(
              controller.data[index]['id'],
              controller.data[index]['title'],
              controller.data[index]['content'],
              controller.data[index]['dateTimeCreated'],
            ),
            onLongPress: () {
              customAlertDialog(
                () {
                  Get.back();
                  controller.deleteData(controller.data[index]['id']);
                },
                () {},
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: .0,
              child: ListTile(
                title: controller.data[index]['title'] == ""
                    ? Text('14'.tr)
                    : Text(
                        "${controller.data[index]['title']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${controller.data[index]['content']}", maxLines: 10),
                    Text(
                      "${controller.data[index]['dateTimeCreated']}",
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
