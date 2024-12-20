import '../../../../../core/utils/app_router.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'custom_image_item.dart';
import 'custom_rating_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.bookDetailsView,
          extra: book,
        );
      },
      child: SizedBox(
        height: 130.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageItem(
              book: book,
            ),
            SizedBox(width: 26.w),
            _buildBookInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBookInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              book.volumeInfo?.title ?? 'No Title',
              style: Styles.textStyle20.copyWith(
                fontFamily: kGTSectraFont,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Text(
            book.volumeInfo?.authors?[0] ?? 'No Author',
            style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          _buildPriceAndRating(),
        ],
      ),
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Free',
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomRatingBook(
          bookModel: book,
        ),
      ],
    );
  }
}
