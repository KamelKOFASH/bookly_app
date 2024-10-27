import 'package:bookly_app/features/Authentication/presentation/views/widgets/social_buttons_row.dart';
import 'package:flutter/material.dart';

class FormSocialButtons extends StatelessWidget {
  const FormSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButtonsRow(
          onGooglePressed: () {},
          onFacebookPressed: () {},
        ),
      ],
    );
  }
}
