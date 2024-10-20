import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class SettingsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsAppBarWidget({
    super.key,
    required this.title,
    this.isSettingsView = false,
  });
  final String title;
 final bool isSettingsView;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isSettingsView ? null : IconButton(
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
  Size get preferredSize => const Size.fromHeight(60);
}
