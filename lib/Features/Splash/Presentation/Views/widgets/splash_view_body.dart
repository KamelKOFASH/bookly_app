import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../features/Authentication/presentation/view_models/cubit/auth_cubit.dart';
import 'sliding_animated_text.dart';

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

    // التأكد من حالة تسجيل الدخول والتنقل بناءً عليها
    checkAuthAndNavigate();
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

  void checkAuthAndNavigate() {
    // استخدام Future.delayed لانتظار انتهاء الأنميشن
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          final authCubit = context.read<AuthCubit>();

          if (authCubit.isUserAuthenticated()) {
            // المستخدم مسجل الدخول، الانتقال إلى homeView
            GoRouter.of(context).pushReplacement(AppRouter.homeView);
          } else {
            // المستخدم غير مسجل، الانتقال إلى loginView
            GoRouter.of(context).pushReplacement(AppRouter.loginView);
          }
        }
      },
    );
  }
}
