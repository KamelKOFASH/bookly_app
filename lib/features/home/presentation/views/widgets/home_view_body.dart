import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_title.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
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
                const FeaturedBooksListView(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                const CustomTitle(title: 'Best Seller'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
