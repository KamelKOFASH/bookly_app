import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return FloatingActionButton(
      backgroundColor: !isDarkMode ? Colors.white : Colors.black,
      elevation: 10,
      shape: const StadiumBorder(),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.searchView);
      },
      child: SpinKitCubeGrid(
        color: isDarkMode ? Colors.white : Colors.black,
        size: 20.0,
      ),
    );
  }
}
