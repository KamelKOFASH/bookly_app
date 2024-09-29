import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_details_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_featured_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating_book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomDetailsViewAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.24),
                    child: const CustomFeaturedItem(),
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
                  const CustomRatingBook(),
                  SizedBox(height: 37.h),
                  const BookActions(),
                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You may also like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const SimilarBooksListView(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
