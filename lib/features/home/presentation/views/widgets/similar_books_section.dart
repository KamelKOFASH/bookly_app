import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import 'similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).similar_books,
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16.h),
        const SimilarBooksListView(),
        SizedBox(height: 40.h),
      ],
    );
  }
}
