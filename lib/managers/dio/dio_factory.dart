import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/logging_exception.dart';

class DioFactory {
  final String _baseUrl;

  DioFactory(this._baseUrl);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 100),
        sendTimeout: const Duration(seconds: 100),
        connectTimeout: const Duration(seconds: 100),
      );

  Dio create() => Dio(_createBaseOptions())
    ..interceptors.add(
      LoggerInterceptor(),
    );
}
