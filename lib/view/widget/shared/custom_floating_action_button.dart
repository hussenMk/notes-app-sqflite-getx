import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Widget widget;
  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      icon: widget,
    );
  }
}
