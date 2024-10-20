import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({
    super.key,
  });

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
                style: Styles.textStyle18.copyWith(
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
                style: Styles.textStyle18.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                ),
              ),
              leading: const Icon(FontAwesomeIcons.solidMoon),
              onToggle: (bool value) {},
              initialValue: true,
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
              leading: const Icon(FontAwesomeIcons.user),
              title: Text(
                S.of(context).profile,
                style: Styles.textStyle18.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                ),
              ),
              onPressed: (context) {
                GoRouter.of(context).push(AppRouter.profileView);
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(FontAwesomeIcons.arrowRightFromBracket),
              title: Text(
                S.of(context).log_out,
                style: Styles.textStyle18.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
                ),
              ),
              onPressed: (context) {},
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
