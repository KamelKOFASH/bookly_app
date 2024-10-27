import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String textfieldName;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.textfieldName,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: textfieldName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
