import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Your Profile',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
