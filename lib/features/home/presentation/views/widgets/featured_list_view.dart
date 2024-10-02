import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_text_error.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomFeaturedItem(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          '',
                    ),
                  );
                }),
          );
        }

        if (state is FeaturedBooksError) {
          return CustomTextError(error: state.message);
        }
        return const CustomCircularIndicator();
      },
    );
  }
}
