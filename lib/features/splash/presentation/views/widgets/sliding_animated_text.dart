import 'package:bookly_app/generated/l10n.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';

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
              S.of(context).splash_text,
              textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: isArabic() ? 'Cairo' : 'Poppins',
              ),
            ),
          );
        });
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
