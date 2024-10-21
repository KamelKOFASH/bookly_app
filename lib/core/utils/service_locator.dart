import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
