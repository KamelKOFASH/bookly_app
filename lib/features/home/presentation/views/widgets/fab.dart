import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      elevation: 10,
      shape: const StadiumBorder(),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.searchView);
      },
      child: const Icon(
        FontAwesomeIcons.magnifyingGlass,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
