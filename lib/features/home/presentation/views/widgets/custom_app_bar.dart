import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Row(
          children: [
            Image.asset(
              AssetsData.logo,
              height: 18.h,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // TODO: implement search functionality
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
