import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormFieldContent extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFormFieldContent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      controller: controller,
      maxLines: null,
      maxLength: 500,
      decoration: InputDecoration(
        hintText: '5'.tr,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        border: InputBorder.none,
      ),
      cursorColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
