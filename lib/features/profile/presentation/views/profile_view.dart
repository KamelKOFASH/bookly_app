import 'package:bookly_app/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomProfileAppBarWidget(
          title: S.of(context).profile,
          isProfileView: true,
        ),
        body: Center(
          child: Text(S.of(context).profile),
        ));
  }
}
