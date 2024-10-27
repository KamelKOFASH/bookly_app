import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormHeader extends StatelessWidget {
  final String image;
  final String textfieldName;
  const FormHeader(
      {super.key, required this.textfieldName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 150.h,
          width: 150.w,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        const SizedBox(height: 20),
        Text(
          textfieldName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
