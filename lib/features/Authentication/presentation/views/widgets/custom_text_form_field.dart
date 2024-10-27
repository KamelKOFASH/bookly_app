import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String textfieldName;
  final String? Function(String?)? validator; 

  const CustomTextFormField({
    super.key,
    required this.textfieldName,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
