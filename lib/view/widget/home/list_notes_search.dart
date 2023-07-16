// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/home_controller.dart';
// import '../../../core/constant/colors.dart';

// class ListNotesSearch extends GetView<HomeController> {
//   const ListNotesSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => controller.goToEditNotes(
//         controller.data[index]['id'],
//         controller.data[index]['title'],
//         controller.data[index]['content'],
//       ),
//       onLongPress: () {
//         Get.defaultDialog(
//           cancelTextColor: AppColors.darkBlue,
//           confirmTextColor: AppColors.white,
//           buttonColor: AppColors.blue,
//           title: "تنبيه",
//           middleText: "هل أنت متأكد من حذف الملاحظة؟",
//           onConfirm: () {
//             Get.back();
//             controller.deleteData(controller.data[index]['id']);
//           },
//           onCancel: () {},
//         );
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: .1,
//         child: ListTile(
//           title: Text("${controller.data[index]['title']}"),
//           subtitle: Text("${controller.data[index]['content']}", maxLines: 10),
//         ),
//       ),
//     );
//   }
// }
