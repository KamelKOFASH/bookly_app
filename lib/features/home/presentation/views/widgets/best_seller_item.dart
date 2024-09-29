import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(width: 26.w),
          Expanded(child: _buildBookInfo(context)),
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

  Widget _buildBookInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            'Harry Potter and the Philosopher\'s Stone',
            style: Styles.textStyle20.copyWith(
              fontFamily: kGTSectraFont,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text(
          'J.K. Rowling',
          style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
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
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
        SizedBox(width: 6.3.w),
        Text(
          '4.9',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' (1200)',
          style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
