import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/profile/presentation/views/profile_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/settings/presentation/views/languages_view.dart';
import 'package:bookly_app/features/settings/presentation/views/settings_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String homeView = '/home';
  static const String bookDetailsView = '/home_details';
  static const String searchView = '/search';
  static const String languageView = '/language';
  static const String settingsView = '/settings';
  static const String profileView = '/profile';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child: BookDetailsView(
              book: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: languageView,
        builder: (context, state) => const LanguagesView(),
      ),
      GoRoute(
        path: profileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: settingsView,
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );
}
