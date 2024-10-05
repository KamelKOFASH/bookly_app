import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingBook extends StatelessWidget {
  const CustomRatingBook({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

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
          bookModel.volumeInfo?.averageRating?.toStringAsFixed(1) ?? '0.0',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' (${bookModel.volumeInfo?.ratingsCount ?? 0})',
          style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
