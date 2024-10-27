import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../generated/l10n.dart';
import '../../view_models/cubit/auth_cubit.dart';
import '../../view_models/cubit/auth_state.dart';
import 'custom_text_form_field.dart';
import 'custom_text_button.dart';
import 'custom_elevated_button.dart';

class FormBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String textfield1, textfield2;

  FormBody({
    super.key,
    required this.textfield1,
    required this.textfield2,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textfieldName: textfield1,
            validator: (value) {
              return value == null || value.isEmpty
                  ? S.of(context).plz_enter_email
                  : null;
            },
            controller: emailController,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            textfieldName: textfield2,
            validator: (value) {
              return value == null || value.isEmpty
                  ? S.of(context).plz_enter_password
                  : null;
            },
            controller: passwordController,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              textfieldName: S.of(context).dont_have_account,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.registerView);
              },
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                GoRouter.of(context).push(AppRouter.homeView);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return CustomCircularIndicator(
                  size: 20.sp,
                );
              }
              return CustomElevatedButton(
                text: S.of(context).login,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context
                        .read<AuthCubit>()
                        .signIn(emailController.text, passwordController.text);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
