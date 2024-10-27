import 'package:bookly_app/core/utils/utils.dart';
import 'package:bookly_app/features/Authentication/presentation/views/register_view.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class FormBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final String textfield1, textfield2;
  FormBody({super.key, required this.textfield1, required this.textfield2});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              textfieldName: textfield1, validator: Utils.validateEmail),
          const SizedBox(height: 20),
          CustomTextFormField(
            textfieldName: textfield2,
            validator: Utils.validatePassword,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              textfieldName: 'Forgot password?',
              onPressed: () {},
            ),
          ),
          CustomElevatedButton(
            text: 'Login',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                GoRouter.of(context).push(AppRouter.homeView);
              }
            },
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            textfieldName: "Don't have an account? Sign-up",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
