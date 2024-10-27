import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../view_models/cubit/auth_cubit.dart';
import '../view_models/cubit/auth_state.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormHeader(
                  textfieldName: S.of(context).sign_up,
                  image: AssetsData.logo,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  textfieldName: S.of(context).email,
                  validator: (value) =>
                      Utils.validateEmail(value, context: context),
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  textfieldName: S.of(context).password,
                  validator: (value) =>
                      Utils.validatePassword(value, context: context),
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  textfieldName: S.of(context).confirm_password,
                  validator: (value) {
                    return value != passwordController.text
                        ? S.of(context).password_not_match
                        : null;
                  },
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    textfieldName: S.of(context).already_have_account,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthAuthenticated) {
                      Navigator.pop(context);
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
                      text: S.of(context).sign_up,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<AuthCubit>().signUp(
                                emailController.text,
                                passwordController.text,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
