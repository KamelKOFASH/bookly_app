import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fab extends StatefulWidget {
  const Fab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> {
  static bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
      },
      shape: const CircleBorder(),
      backgroundColor: !isDarkMode
          ? const Color.fromARGB(255, 51, 51, 51)
          : const Color.fromARGB(255, 205, 147, 0),
      child: Icon(isDarkMode
          ? FontAwesomeIcons.solidSun // Change to Sun icon for light mode
          : FontAwesomeIcons.solidMoon), // Moon icon for dark mode
    );
  }
}
