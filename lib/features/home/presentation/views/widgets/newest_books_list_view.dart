import '../../../../../core/widgets/custom_text_error.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../view_models/newest_books_cubit/newest_books_cubit.dart';
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
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling since the parent scrolls
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: BookItem(
                    book: state.books[index],
                  ),
                );
              },
            ),
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
      child: SizedBox(
        height: 400.h, // Ensure height is constrained during loading
        child: ListView.builder(
          itemCount: 20,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: const BookItem(
                book: BookModel(),
              ),
            );
          },
        ),
      ),
    );
  }
}
