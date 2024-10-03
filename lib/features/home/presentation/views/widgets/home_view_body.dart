import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_title.dart';
import 'featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                const FeaturedBooksListView(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                const CustomTitle(title: 'Newest Books'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
