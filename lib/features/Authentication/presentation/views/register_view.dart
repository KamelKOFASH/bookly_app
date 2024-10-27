import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(_firebaseAuth),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FormHeader(
                    textfieldName: 'Sign-Up',
                    image: AssetsData.logo,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textfieldName: 'Email',
                    validator: Utils.validateEmail,
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textfieldName: 'Password',
                    validator: Utils.validatePassword,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textfieldName: 'Confirm Password',
                    validator: (value) {
                      return value != passwordController.text
                          ? 'Passwords do not match'
                          : null;
                    },
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      textfieldName: 'Already have an account? Log-in',
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
                        return const CustomCircularIndicator();
                      }
                      return CustomElevatedButton(
                        text: 'Sign Up',
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
      ),
    );
  }
}
