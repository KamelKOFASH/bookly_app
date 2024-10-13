import '../../../../../core/functions/launch_url.dart';
import '../../../data/models/book_model/book_model.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              textColor: Colors.black,
              bgColor: Colors.white,
              radius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, book.volumeInfo?.previewLink ?? '');
              },
              text: getText(book),
              textColor: Colors.white,
              bgColor: const Color(0xffEF8262),
              radius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }


  String getText(BookModel book) {
    if (book.volumeInfo?.previewLink == null) {
      return 'Not Available';
    }
    return 'Preview';
  }
}
