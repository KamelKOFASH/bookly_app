import '../../../../core/errors/failure.dart';
import '../../../../core/models/book_model/book_model.dart';
import 'search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String query}) async {
    try {
      var value = await _apiService.get(
          endPoint: "volumes?q=subject:$query&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in value["items"]) {
        try {
          books.add(BookModel.fromJson(element));
        } catch (e) {
          //To add only the books without null values
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
