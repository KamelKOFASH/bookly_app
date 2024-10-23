import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNotificationAppBar(
      {super.key, required this.isNotificationView, required this.title});
  final bool isNotificationView;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isNotificationView
          ? null
          : IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                FontAwesomeIcons.chevronLeft,
                size: 18.sp,
              ),
            ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
