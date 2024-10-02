import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_details_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_featured_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const CustomDetailsViewAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.24),
          child: const CustomFeaturedItem(imageUrl: AssetsData.testImage,),
        ),
        SizedBox(height: 30.h),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        SizedBox(height: 6.h),
        Text(
          "Rudyard Kipling",
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 12.h),
        const CustomRatingBook(bookModel: BookModel(),),
        SizedBox(height: 37.h),
        const BookActions(),
        SizedBox(height: 50.h),
      ],
    );
  }
}
