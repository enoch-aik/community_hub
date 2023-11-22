
import 'package:community_hub/core/service_exceptions/service_exception.dart';
import 'package:dio/dio.dart';

String errorInterceptor(Object E) {
  if (E is DioException) {
    if (E.response?.statusCode == 400) {
      return E.response?.data['detail'];
    } else {
      return ApiExceptions.getErrorMessage(ApiExceptions.getDioException(E)!);
    }
  } else {
    return ApiExceptions.getErrorMessage(
      const ApiExceptions.defaultError(
          'Something went wrong, Please try again later',),
    );
  }
}
