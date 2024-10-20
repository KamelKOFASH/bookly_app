import 'package:bookly_app/features/settings/presentation/view_models/cubit/locale_language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/settings/presentation/views/widgets/settings_app_bar.dart';
import '../../../../generated/l10n.dart';

class LanguagesView extends StatefulWidget {
  const LanguagesView({super.key});

  @override
  _LanguagesViewState createState() => _LanguagesViewState();
}

class _LanguagesViewState extends State<LanguagesView> {
  String? selectedLanguageCode;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> languages = [
      {'code': 'en', 'name': S.of(context).English, 'flag': '🇺🇸'},
      {'code': 'ar', 'name': S.of(context).Arabic, 'flag': '🇪🇬'},
    ];

    return Scaffold(
      appBar: SettingsAppBarWidget(title: S.of(context).select_language),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).choose_language,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              value: selectedLanguageCode,
              hint: Text(
                S.of(context).select_a_language,
                style: Styles.textStyle16,
              ),
              items: languages.map((language) {
                return DropdownMenuItem<String>(
                  value: language['code'], // Use language code here
                  child: Row(
                    children: [
                      Text(
                        language['flag'] ?? '',
                        style: Styles.textStyle16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        language['name'] ?? '',
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguageCode = value;
                  // Change the locale using the LocaleCubit
                  context.read<LocaleLanguageCubit>().changeLocale(value!);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
