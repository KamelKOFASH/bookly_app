import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/models/book_model/book_model.dart';
import 'home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Sorting=newest&q=subject:programming&Filtering=free-ebooks&orderBy=newest");

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:programming");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      String category) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=programming+subject:$category&filter=free-ebooks&orderBy=relevance");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
