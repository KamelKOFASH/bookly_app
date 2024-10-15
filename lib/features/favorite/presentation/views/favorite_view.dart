import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Your Favorites',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
