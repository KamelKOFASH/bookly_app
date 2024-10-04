import '../../../data/models/book_model/book_model.dart';
import 'book_details_section.dart';
import 'similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BookDetailsSection(bookModel: book,),
                  const SimilarBooksSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
