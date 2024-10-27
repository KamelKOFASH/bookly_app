import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_body.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_social_buttons.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../generated/l10n.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               FormHeader(
                  image: AssetsData.logo, textfieldName: S.of(context).login),
              const SizedBox(height: 20),
              FormBody(textfield1: S.of(context).email, textfield2: S.of(context).password),
              const SizedBox(height: 20),
              const FormSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
