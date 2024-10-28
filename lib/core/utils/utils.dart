import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class Utils {
  static List<String> images = [
    'assets/images/avatar1.jpg',
    'assets/images/avatar2.jpg',
    'assets/images/avatar3.jpg',
    'assets/images/avatar4.jpg',
    'assets/images/avatar5.jpg',
    'assets/images/avatar6.jpg',
    'assets/images/avatar7.jpg',
    'assets/images/avatar8.jpg',
  ];
  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: SpinKitCircle(
            duration: Duration(milliseconds: 800),
            color: Colors.blue,
            size: 50.0,
          ),
        );
      },
    );
  }

//Validators
//....
// Validator for Email
  static String? validateEmail(String? value, {required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return S.of(context).plz_enter_email;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return S.of(context).please_enter_valid_email;
    }
    return null;
  }

// Validator for Password
  static String? validatePassword(String? value,
      {required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return S.of(context).plz_enter_password;
    }
    if (value.length < 6) {
      return S.of(context).please_enter_strong_password;
    }
    return null;
  }

// Add more validators MKammmeeeeel
}
