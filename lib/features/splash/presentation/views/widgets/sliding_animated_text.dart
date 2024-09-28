import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingTextWidget extends StatelessWidget {
  const SlidingTextWidget({
    super.key,
    required AnimationController animationController,
    required Animation<Offset> animation,
  })  : _animationController = animationController,
        _animation = animation;

  final AnimationController _animationController;
  final Animation<Offset> _animation;

  @override
  Widget build(BuildContext context) {
    //? i used "AnimatedBuilder" to make it clean and build this only animation not all screen
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return SlideTransition(
            position: _animation,
            child: Text(
              'Discover the best books in the world',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          );
        });
  }
}
