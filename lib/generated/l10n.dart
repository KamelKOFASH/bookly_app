// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Newest Books`
  String get newest_books {
    return Intl.message(
      'Newest Books',
      name: 'newest_books',
      desc: '',
      args: [],
    );
  }

  /// `Similar Books`
  String get similar_books {
    return Intl.message(
      'Similar Books',
      name: 'similar_books',
      desc: '',
      args: [],
    );
  }

  /// `Search a book`
  String get search {
    return Intl.message(
      'Search a book',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No books found`
  String get no_books_found {
    return Intl.message(
      'No books found',
      name: 'no_books_found',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get search_result {
    return Intl.message(
      'Search Result',
      name: 'search_result',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get notAvailable {
    return Intl.message(
      'Not Available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Discover the best books in the world`
  String get splash_text {
    return Intl.message(
      'Discover the best books in the world',
      name: 'splash_text',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Choose your Language`
  String get choose_language {
    return Intl.message(
      'Choose your Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Select a language`
  String get select_a_language {
    return Intl.message(
      'Select a language',
      name: 'select_a_language',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notifications {
    return Intl.message(
      'Notification',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get book_marks {
    return Intl.message(
      'Bookmarks',
      name: 'book_marks',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get plz_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'plz_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get plz_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'plz_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Don"t have an account? Sign-Up`
  String get dont_have_account {
    return Intl.message(
      'Don"t have an account? Sign-Up',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Log-In`
  String get login {
    return Intl.message(
      'Log-In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign-Up`
  String get sign_up {
    return Intl.message(
      'Sign-Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get or_login_with {
    return Intl.message(
      'Or login with',
      name: 'or_login_with',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Log-In`
  String get already_have_account {
    return Intl.message(
      'Already have an account? Log-In',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a strong password`
  String get please_enter_strong_password {
    return Intl.message(
      'Please enter a strong password',
      name: 'please_enter_strong_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Logout`
  String get confirm_logout {
    return Intl.message(
      'Confirm Logout',
      name: 'confirm_logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get are_you_sure_logout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'are_you_sure_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get retry {
    return Intl.message(
      'Try Again',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection!`
  String get check_your_internet {
    return Intl.message(
      'Check your internet connection!',
      name: 'check_your_internet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
