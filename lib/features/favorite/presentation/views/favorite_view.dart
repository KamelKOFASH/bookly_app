import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});
  final List<String> imageUrls = [
    "https://l1nq.com/H1hAP",
    "https://l1nq.com/2X2Ge"
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite'),
      ),
    );
  }
}
