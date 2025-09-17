import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/models/user_model.dart';
import 'package:jr_case_boilerplate/core/services/dio_service.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_provider.g.dart';

@riverpod
Future<UserData> getProfile(Ref ref) async {
  final dio = ref.read(dioService).dio;

  try {
    final response = await dio.get('/user/profile');
    Print.info("Profile data: ${response.data}");
    final userModel = UserModel.fromJson(response.data);
    if (userModel.response.code != 200) {
      throw Exception(t.failed_to_fetch(error: userModel.response.message));
    }
    return userModel.data;
  } on DioException catch (e) {
    Print.error("Profile error: ${e.response?.data}");
    rethrow;
  }
}
