import 'package:bookly_app/generated/l10n.dart';

import 'widgets/settings_app_bar.dart';
import 'widgets/settings_view_body.dart';
import 'package:flutter/material.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBarWidget(
        title: S.of(context).settings,
        isSettingsView: true,
      ),
      body: const SettingsViewBody(),
    );
  }
}
