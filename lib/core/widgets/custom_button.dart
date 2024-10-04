import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.radius,
  });
  final Color bgColor;
  final Color textColor;
  final String text;
  final BorderRadius? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
