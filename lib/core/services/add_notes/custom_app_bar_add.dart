import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarAdd extends StatelessWidget {
  const CustomAppBarAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
