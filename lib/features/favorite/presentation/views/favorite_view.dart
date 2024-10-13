import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Your Favorites',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}


