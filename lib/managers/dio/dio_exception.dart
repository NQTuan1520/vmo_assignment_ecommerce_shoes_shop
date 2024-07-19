import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class MyDioException implements Exception {
  late String errorMessage;

  MyDioException(this.errorMessage);

  MyDioException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = tr('request_cancelled');
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = tr('connection_timeout');
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = tr('receive_timeout');
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = tr('send_timeout');
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = tr('no_internet');
          break;
        }
        errorMessage = tr('unexpected_error');
        break;
      default:
        errorMessage = tr('something_went_wrong');
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return tr('bad_request');
      case 401:
        return tr('authentication_failed');
      case 403:
        return tr('access_denied');
      case 404:
        return tr('resource_not_found');
      case 405:
        return tr('method_not_allowed');
      case 415:
        return tr('unsupported_media_type');
      case 422:
        return tr('data_validation_failed');
      case 429:
        return tr('too_many_requests');
      case 500:
        return tr('internal_server_error');
      default:
        return tr('generic_error');
    }
  }

  @override
  String toString() => errorMessage;
}
