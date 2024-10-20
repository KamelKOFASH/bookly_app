import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleLanguageCubit extends Cubit<Locale> {
  LocaleLanguageCubit() : super(const Locale('en')) {
    _loadSavedLocale(); // Load the saved locale when the cubit is initialized
  }

  // Method to change the locale and save it to SharedPreferences
  void changeLocale(String languageCode) async {
    emit(Locale(languageCode));

    // Save the selected locale in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', languageCode);
  }

  // Method to load the saved locale from SharedPreferences
  Future<void> _loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocaleCode = prefs.getString('locale');

    // If a saved locale exists, emit the saved locale
    if (savedLocaleCode != null) {
      emit(Locale(savedLocaleCode));
    }
  }
}
