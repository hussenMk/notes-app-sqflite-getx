import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String txtButton;
  final void Function()? onPressed;
  const CustomButtonLang(
      {Key? key, required this.txtButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        color: Theme.of(context).colorScheme.onPrimary,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          txtButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
