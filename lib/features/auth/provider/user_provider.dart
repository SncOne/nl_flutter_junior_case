import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  FutureOr<void> build() async {
    return;
  }

  /// Login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final dio = ref.read(dioService).dio;

    try {
      final response = await dio.post(
        '/user/login',
        data: {"email": email, "password": password},
      );
      return response.data;
    } on DioException catch (e) {
      Print.error("Login error: ${e.response?.data}");
      rethrow;
    }
  }

  /// Register
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final dio = ref.read(dioService).dio;

    try {
      final response = await dio.post(
        '/user/register',
        data: {"name": name, "email": email, "password": password},
      );
      return response.data;
    } on DioException catch (e) {
      Print.error("Register error: ${e.response?.data}");
      rethrow;
    }
  }

  /// Profile
  Future<Map<String, dynamic>> getProfile() async {
    final dio = ref.read(dioService).dio;

    try {
      final response = await dio.get('/user/profile');
      return response.data;
    } on DioException catch (e) {
      Print.error("Profile error: ${e.response?.data}");
      rethrow;
    }
  }

  /// Upload Photo
  Future<Map<String, dynamic>> uploadPhoto(File file) async {
    final dio = ref.read(dioService).dio;

    try {
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });

      final response = await dio.post(
        '/user/upload_photo',
        data: formData,
        options: Options(contentType: "multipart/form-data"),
      );

      return response.data;
    } on DioException catch (e) {
      Print.error("Upload photo error: ${e.response?.data}");
      rethrow;
    }
  }
}
