import '../../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkenMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18.h,
            color: isDarkenMode ? Colors.white : Colors.black,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.notificationsView);
            },
            icon: Icon(
              FontAwesomeIcons.solidBell,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
