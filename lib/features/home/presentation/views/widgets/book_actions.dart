import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/functions/launch_url.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: S.of(context).free,
              textColor: Colors.black,
              bgColor: Colors.white,
              radius: BorderRadius.only(
                topLeft: !isArabic() ? const Radius.circular(16) : Radius.zero,
                bottomLeft:
                    !isArabic() ? const Radius.circular(16) : Radius.zero,
                topRight: isArabic() ? const Radius.circular(16) : Radius.zero,
                bottomRight:
                    isArabic() ? const Radius.circular(16) : Radius.zero,
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, book.volumeInfo?.previewLink ?? '');
              },
              text: getText(book, context: context),
              textColor: Colors.white,
              bgColor: const Color(0xffEF8262),
              radius: BorderRadius.only(
                topRight: !isArabic() ? const Radius.circular(16) : Radius.zero,
                bottomRight:
                    !isArabic() ? const Radius.circular(16) : Radius.zero,
                topLeft: isArabic() ? const Radius.circular(16) : Radius.zero,
                bottomLeft:
                    isArabic() ? const Radius.circular(16) : Radius.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  String getText(BookModel book, {required BuildContext context}) {
    if (book.volumeInfo?.previewLink == null) {
      return S.of(context).notAvailable;
    }
    return S.of(context).preview;
  }
}
