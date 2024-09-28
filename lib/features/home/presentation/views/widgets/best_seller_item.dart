import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBookImage(),
          SizedBox(width: 26.w), // Add spacing between the image and text.
          Expanded(child: _buildBookInfo()),
        ],
      ),
    );
  }

  Widget _buildBookImage() {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(AssetsData.testImage),
          ),
        ),
      ),
    );
  }

  Widget _buildBookInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Harry Potter \nand the Philosopher\'s Stone',
          style: Styles.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'J.K. Rowling',
          style: Styles.titleSmall.copyWith(color: Colors.grey.shade600),
        ),
        _buildPriceAndRating(),
      ],
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '19.99 \$',
          style: Styles.titleMedium,
        ),
        _buildRating(),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 15.sp,
          color: Colors.yellow.shade700,
        ),
        SizedBox(width: 8.w),
        Text(
          '4.9',
          style: Styles.titleSmall.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          ' (1200)',
          style: Styles.titleSmall.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
