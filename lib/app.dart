import 'package:bookly_app/generated/l10n.dart';
import 'package:bookly_app/features/settings/presentation/view_models/cubits/theme_cubit.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import 'features/settings/presentation/view_models/cubits/locale_language_cubit.dart';
import 'features/search/data/repositories/search_repo_impl.dart';
import 'features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'core/utils/service_locator.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<SearchRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => LocaleLanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<LocaleLanguageCubit, Locale>(
        builder: (context, localeState) {
          bool isArabic = localeState.languageCode == 'ar';
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                useInheritedMediaQuery: true,
                child: MaterialApp.router(
                  locale: localeState,
                  themeMode: themeMode,
                  theme: ThemeData.light().copyWith(
                    scaffoldBackgroundColor: Colors.white,
                    textTheme: GoogleFonts.getTextTheme(
                      isArabic ? 'Cairo' : 'Montserrat',
                      ThemeData.light().textTheme,
                    ),
                  ),
                  darkTheme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: kPrimaryColor,
                    textTheme: GoogleFonts.getTextTheme(
                      isArabic ? 'Cairo' : 'Montserrat',
                      ThemeData.dark().textTheme,
                    ),
                  ),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
