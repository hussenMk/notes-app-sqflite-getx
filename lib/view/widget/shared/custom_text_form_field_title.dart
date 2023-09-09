import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormFieldTitle extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFormFieldTitle({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '4'.tr,
        hintStyle: TextStyle(
          fontSize: 22,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 25.0,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
