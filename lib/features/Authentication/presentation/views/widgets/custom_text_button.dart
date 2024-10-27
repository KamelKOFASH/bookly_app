import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String textfieldName;
  final void Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.textfieldName, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(textfieldName),
    );
  }
}
