import '../../../../../core/utils/styles.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'book_actions.dart';
import 'custom_details_view_app_bar.dart';
import 'custom_image_item.dart';
import 'custom_rating_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const CustomDetailsViewAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.24),
          child: CustomImageItem(
            book: bookModel,
          ),
        ),
        SizedBox(height: 30.h),
        Text(
          bookModel.volumeInfo?.title ?? '',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.h),
        Text(
          bookModel.volumeInfo?.authors?[0] ?? '',
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        CustomRatingBook(
          bookModel: bookModel,
        ),
        SizedBox(height: 37.h),
         BookActions(
          book: bookModel,
         ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
