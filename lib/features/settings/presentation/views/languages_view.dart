import '../view_models/cubits/locale_language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/settings_app_bar.dart';
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
      {
        'code': 'en',
        'name': S.of(context).English,
        'flag': '🇺🇸',
      },
      {
        'code': 'ar',
        'name': S.of(context).Arabic,
        'flag': '🇪🇬',
      },
    ];

    return Scaffold(
      appBar: SettingsAppBarWidget(title: S.of(context).language),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).choose_language,
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                value: selectedLanguageCode,
                hint: Text(
                  S.of(context).select_a_language,
                  style: Styles.textStyle16.copyWith(color: Colors.grey[700]),
                ),
                underline: const SizedBox(),
                items: languages.map((language) {
                  return DropdownMenuItem<String>(
                    value: language['code'],
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedLanguageCode == language['code']
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Text(
                            language['flag'] ?? '',
                            style: Styles.textStyle18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            language['name'] ?? '',
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w600,
                              color: selectedLanguageCode == language['code']
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguageCode = value;
                    context.read<LocaleLanguageCubit>().changeLocale(value!);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
