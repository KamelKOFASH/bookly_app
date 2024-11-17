import 'package:bookly_app/features/settings/presentation/views/widgets/log_out_dialpg.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../splash/presentation/views/widgets/sliding_animated_text.dart';
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
        //? General Section
        SettingsSection(
          title: Text(
            S.of(context).general,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: isArabic() ? 'Cairo' : 'Poppins',
            ),
          ),
          tiles: [
            //* Language
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
            //* Dark Mode
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

        //? Account Section
        SettingsSection(
          title: Text(
            S.of(context).account,
            style: Styles.textStyle20.copyWith(
              fontFamily: isArabic() ? 'Cairo' : 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          tiles: [
            //* Notifications
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
            //* Log Out
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogOutDialog();
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
