import 'package:flutter/material.dart';
import 'package:notes_app_sqflite/core/constant/colors.dart';

class TskCheckBox extends StatelessWidget {
  final bool? checkState;
  final void Function(bool?)? checkboxChanged;
  const TskCheckBox({
    super.key,
    this.checkState,
    this.checkboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checkState,
        onChanged: checkboxChanged,
        activeColor: AppColors.teal);
  }
}
