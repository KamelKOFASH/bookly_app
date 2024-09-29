import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingBook extends StatelessWidget {
  const CustomRatingBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 15.sp,
          color: Colors.yellow.shade700,
        ),
        SizedBox(width: 6.5.w),
        Text(
          '4.9',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' (1200)',
          style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}