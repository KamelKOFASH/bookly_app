import '../../../../../core/widgets/custom_text_error.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'custom_image_item.dart';
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
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: CustomImageItem(
                    book:
                        state.books[index],
                  ),
                );
              },
            ),
          );
        }

        if (state is FeaturedBooksError) {
          return CustomTextError(error: state.message);
        } else {
          return buildSkeletonizerLoading(context);
        }
      },
    );
  }

  Skeletonizer buildSkeletonizerLoading(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child:  const CustomImageItem(
                book: BookModel(),
              ),
            );
          },
        ),
      ),
    );
  }
}
