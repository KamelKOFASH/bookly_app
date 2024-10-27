import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_body.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_header.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/form_social_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../view_models/cubit/auth_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(_firebaseAuth),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FormHeader(
                    image: AssetsData.logo, textfieldName: 'Log-In'),
                const SizedBox(height: 20),
                FormBody(textfield1: 'Email', textfield2: 'Password'),
                const SizedBox(height: 20),
                const FormSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
