import 'package:intl/intl.dart';

import 'features/settings/presentation/view_models/cubit/locale_language_cubit.dart';
import 'generated/l10n.dart';
import 'features/search/data/repositories/search_repo_impl.dart';
import 'features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupServiceLocator();
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
              create: (context) => LocaleLanguageCubit(), // Provide LocaleCubit
            ),
          ],
          child: BlocBuilder<LocaleLanguageCubit, Locale>(
            builder: (context, state) {
              bool isArabic = state.languageCode == 'ar';
              return MaterialApp.router(
                locale: state,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: kPrimaryColor,
                  // Change the font based on the locale
                  textTheme: GoogleFonts.getTextTheme(
                    isArabic == true ? 'Cairo' : 'Montserrat',
                    ThemeData.dark().textTheme,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// bool isArabic() {
//   return Intl.getCurrentLocale() == 'ar';
// }
