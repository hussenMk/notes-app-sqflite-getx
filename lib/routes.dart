import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes_app_sqflite/view/screen/add.dart';
import 'package:notes_app_sqflite/view/screen/edit.dart';
import 'package:notes_app_sqflite/view/screen/home.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Home()),
  // GetPage(name: "/", page: () => const Auth(), middlewares: [MyMiddleWare()]),

  //Welcome
  // GetPage(name: AppRoutes.welcome, page: () => const Welcome()),

  //Home
  GetPage(name: AppRoutes.home, page: () => const Home()),

  // Notes
  GetPage(name: AppRoutes.addNotes, page: () => const AddNotes()),
  GetPage(name: AppRoutes.editNotes, page: () => const EditNotes()),
];
