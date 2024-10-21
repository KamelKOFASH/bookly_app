import '../../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageItem extends StatelessWidget {
  const CustomImageItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
      },
      child: Card(
        elevation: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
