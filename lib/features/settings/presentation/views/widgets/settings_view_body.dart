import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../Authentication/presentation/view_models/cubit/auth_cubit.dart';
import '../../view_models/cubits/theme_cubit.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({
    super.key,
  });

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text(
            S.of(context).general,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: isArabic() ? 'Cairo' : 'Poppins',
            ),
          ),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(FontAwesomeIcons.language),
              title: Text(
                S.of(context).language,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                ),
              ),
              onPressed: (context) {
                GoRouter.of(context).push(AppRouter.languageView);
              },
            ),
            SettingsTile.switchTile(
              title: Text(
                S.of(context).dark_mode,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                ),
              ),
              leading: const Icon(FontAwesomeIcons.solidMoon),
              initialValue: context.read<ThemeCubit>().state == ThemeMode.dark,
              onToggle: (bool value) {
                setState(() {
                  context.read<ThemeCubit>().toggleTheme(value);
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text(
            S.of(context).account,
            style: Styles.textStyle20.copyWith(
              fontFamily: isArabic() ? 'Cairo' : 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(FontAwesomeIcons.solidBell),
              title: Text(
                S.of(context).notifications,
                style: Styles.textStyle16.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: (context) {
                GoRouter.of(context).push(AppRouter.notificationsView);
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(FontAwesomeIcons.arrowRightFromBracket),
              title: Text(
                S.of(context).log_out,
                style: Styles.textStyle16.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: (context) {
                context.read<AuthCubit>().signOut();
                GoRouter.of(context).push(AppRouter.loginView);
              },
            ),
          ],
        ),
      ],
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
