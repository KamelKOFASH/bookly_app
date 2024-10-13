import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      child: const Icon(Icons.add), // FAB icon
    );
  }
}
