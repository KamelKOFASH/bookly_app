import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ), // Add spacing between items(8.0),
            child: const BookItem(book: BookModel(),),
          );
        });
  }
}
