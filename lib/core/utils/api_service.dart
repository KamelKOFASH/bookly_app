import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio; //? _ means private

  ApiService(this._dio);

  //! get request
  Future<Map<String, dynamic>> get(
      {required String endPoint, String? token}) async {
    final response = await _dio.get(
      "$_baseUrl$endPoint",
      options: Options(
        headers: token != null ? {"Authorization": "Bearer $token"} : {},
      ),
    );
    return response.data;
  }

  //! post request
  Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: token != null ? {"Authorization": "Bearer $token"} : {},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          'Failed to load products: ${e.response?.statusCode}, ${e.response?.data}');
    }
  }

  //! put request
  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.response?.statusCode}');
    }
  }

  //! delete request
  Future<dynamic> delete({required String url}) async {
    try {
      final response = await _dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.response?.statusCode}');
    }
  }

  //! patch request
  Future<dynamic> patch(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response = await _dio.patch(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.response?.statusCode}');
    }
  }

  //! head request
  Future<dynamic> head({required String url}) async {
    try {
      final response = await _dio.head(url);
      return response.data; // Note: HEAD requests usually do not return a body
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.response?.statusCode}');
    }
  }
}
