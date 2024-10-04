import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            const CustomSearchTextField(),
            SizedBox(height: 20.h),
            const Expanded(child: SearchResultListView()),
          ],
        ),
      ),
    );
  }
}
