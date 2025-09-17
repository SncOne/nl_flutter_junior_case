import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final dioService = Provider((ref) => DioService(ref)..addInterceptors());

class DioService {
  DioService(this.ref);
  final Ref ref;

  Dio get dio => _dio;

  static const _baseUrl = 'https://caseapi.servicelabs.tech/';
  static final _headers = <String, Object?>{};

  final _dio = Dio(BaseOptions(baseUrl: _baseUrl, headers: _headers));

  Future<Response> get(
    String path, {
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    Map<String, Object?>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> postRaw(
    String path, {
    required Object? data,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, Object?>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> postForm(
    String path, {
    required FormData formData,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, Object?>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: formData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<void> addInterceptors() async {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await secureStorage.read(
            key: AppLocalStorageKeys.jwtToken.name,
          );
          if (token != null && token.isNotEmpty) {
            if (JwtDecoder.isExpired(token)) {
              Print.error('JWT süresi doldu ve yenilenemedi');
              // go to login
              ref.read(routerProvider).replaceAll([const LoginRoute()]);
              return handler.reject(
                DioException(
                  requestOptions: options,
                  error: 'Token expired and could not be refreshed',
                ),
              );
            }
          }

          options.headers['Authorization'] = 'Bearer $token';
          Print.info('Token: $token');
          Print.info('options.headers: ${options.headers}');
          Print.info('options.headers: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // go to login
            ref.read(routerProvider).replaceAll([const LoginRoute()]);
            return handler.next(e);
          }
          return handler.next(e);
        },
      ),
    ]);
  }
}

class CustomException implements Exception {
  CustomException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleResponseError(
          dioError.response!.statusCode!,
          dioError.requestOptions,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.unknown:
        message = 'Connection to API server failed due to internet connection';
        break;
      default:
        message = 'Something went wrong';
    }
  }

  late String message;

  String _handleResponseError(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops, something went wrong $statusCode $data';
    }
  }

  @override
  String toString() => message;
}
