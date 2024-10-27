import 'package:bookly_app/features/Authentication/presentation/views/login_view.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/utils.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FormHeader(
                    textfieldName: 'Sign-Up', image: AssetsData.logo),
                const SizedBox(height: 20),
                const CustomTextFormField(
                    textfieldName: 'Email', validator: Utils.validateEmail),
                const SizedBox(height: 20),
                const CustomTextFormField(
                    textfieldName: 'Password',
                    validator: Utils.validatePassword),
                const SizedBox(height: 20),
                const CustomTextFormField(
                    textfieldName: 'Confirm Password',
                    validator: Utils.validatePassword),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    textfieldName: 'Already have an account? Log-in',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
