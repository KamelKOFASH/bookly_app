import '../../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets.dart';
import 'sliding_animated_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToAuth();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SlidingTextWidget(
            animationController: _animationController, animation: _animation),
      ],
    );
  }

  void initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 6),
      end: const Offset(0, 0),
    ).animate(_animationController);

    _animationController.forward();
  }

  void navigateToAuth() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          GoRouter.of(context).push(AppRouter.loginView);
        }
      },
    );
  }
}
