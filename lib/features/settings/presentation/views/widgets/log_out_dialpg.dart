import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Authentication/presentation/view_models/cubit/auth_cubit.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).confirm_logout),
      content: Text(S.of(context).are_you_sure_logout),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0.r),
        ),
      ),
      icon: const Icon(FontAwesomeIcons.circleExclamation),
      iconColor: Colors.red,
      backgroundColor: kPrimaryColor,
      actions: [
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(S.of(context).log_out),
          onPressed: () {
            context.read<AuthCubit>().signOut();
            GoRouter.of(context).push(AppRouter.loginView);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
