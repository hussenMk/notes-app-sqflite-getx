import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';
import '../../../core/constant/image_asset.dart';

class CustomWelcomeScreen extends StatelessWidget {
  const CustomWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(ImageAsset.welcome3),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "لا يوجد لديك ملاحظات !",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.blueDark,
            ),
          ),
        ],
      ),
    );
  }
}
