import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
