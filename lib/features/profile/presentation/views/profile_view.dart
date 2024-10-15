import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Your Profile',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
