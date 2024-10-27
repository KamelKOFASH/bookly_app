import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_body.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_social_buttons.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FormHeader(image: AssetsData.logo, textfieldName: 'Log-In'),
              const SizedBox(height: 20),
              FormBody(textfield1: 'Email', textfield2: 'Password'),
              const SizedBox(height: 20),
              const FormSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
