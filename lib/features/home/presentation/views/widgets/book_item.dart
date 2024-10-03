import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating_book.dart';
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
        GoRouter.of(context).push(AppRouter.homeDetailsView);
      },
      child: SizedBox(
        height: 130.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageItem(
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            ),
            SizedBox(width: 26.w),
            Expanded(child: _buildBookInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBookInfo(BuildContext context) {
    return Column(
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
          book.volumeInfo?.authors![0] ?? 'No Author',
          style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
        ),
        _buildPriceAndRating(),
      ],
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
