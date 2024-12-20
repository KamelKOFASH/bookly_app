import 'package:bookly_app/features/Authentication/presentation/view_models/cubit/auth_cubit.dart';
import 'package:bookly_app/features/Authentication/presentation/views/widgets/social_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSocialButtons extends StatelessWidget {
  const FormSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButtonsRow(
          onGooglePressed: () {
            context.read<AuthCubit>().signInWithGoogle();
          },
          onFacebookPressed: () {},
        ),
      ],
    );
  }
}
