import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.size = 50.0});
  final double size;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: SpinKitCubeGrid(
        color: isDarkMode ? Colors.white : Colors.black,
        size: size,
      ),
    );
  }
}
