import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeaturedBooksCubit(
                getIt.get<HomeRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                getIt.get<HomeRepoImpl>(),
              ),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme,
              ),
            ),
          ),
        );
      },
    );
  }
}
