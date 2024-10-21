import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme(); //? تحميل حالة الثيم عند بدء التشغيل
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false; //? القيمة الافتراضية
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode); //? تخزين حالة الثيم
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
