import '../../../../../core/widgets/custom_text_error.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../view_models/similar_books_cubit/similar_books_cubit.dart';
import 'custom_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CustomImageItem(
                      book: state.books[index],
                    ),
                  );
                }),
          );
        }

        if (state is SimilarBooksFailure) {
          return const CustomTextError(error: 'No books found');
        }
        return Skeletonizer(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const CustomImageItem(
                      book: BookModel(),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
