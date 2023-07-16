import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedRight;

  final void Function()? onPressedLeft;
  final Widget iconRight;
  final Widget iconLeft;
  final Widget widget;

  const CustomAppBar({
    Key? key,
    this.onPressedRight,
    this.onPressedLeft,
    required this.iconRight,
    required this.iconLeft,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onPressedRight,
              icon: iconRight,
            ),
          ),
          Row(
            children: [
              widget,
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: onPressedLeft,
                  icon: iconLeft,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
