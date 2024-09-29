import '../../../../../Core/utils/assets.dart';
import '../../../../../constants.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'sliding_animated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
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
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 6),
      end: const Offset(0, 0),
    ).animate(_animationController);

    _animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.circularReveal,
        duration: kTranstionDuration,
      );
    });
  }
}
