import 'package:bookly_app/core/widgets/custom_text_error.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ), // Add spacing between items(8.0),
                child: BookItem(
                  book: state.books[index],
                ),
              );
            },
          );
        }

        if (state is NewestBooksFailure) {
          return CustomTextError(error: state.errMessage);
        }

        return buildSkeletonizerLoading();
      },
    );
  }

  Skeletonizer buildSkeletonizerLoading() {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ), // Add spacing between items(8.0),
            child: const BookItem(
              book: BookModel(),
            ),
          );
        },
      ),
    );
  }
}