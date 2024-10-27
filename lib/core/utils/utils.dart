
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

// Validator for Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

// Add more validators MKammmeeeeel
}
