import 'package:flutter/material.dart';

class SocialButtonsRow extends StatelessWidget {
  final void Function() onGooglePressed;
  final void Function() onFacebookPressed;

  const SocialButtonsRow({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Divider(color: Colors.black, thickness: 1),
              ),
            ),
            const Text('Or login with'),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Divider(color: Colors.black, thickness: 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                onGooglePressed;
              },
              icon: const Icon(Icons.email),
              label: const Text('Google'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                onFacebookPressed;
              },
              icon: const Icon(Icons.facebook),
              label: const Text('Facebook'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
