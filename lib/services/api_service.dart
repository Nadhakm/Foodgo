import 'package:dio/dio.dart';

import '../models/login_response.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.gulika.app/api/",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "login/",
        data: {"email": email, "password": password},
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data["detail"] ?? "Login failed");
      }
      throw Exception("Unable to connect to server");
    }
  }
}
