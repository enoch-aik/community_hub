import 'package:community_hub/core/service_exceptions/service_exception.dart';
import 'package:community_hub/core/service_result/service_result.dart';
import 'package:community_hub_client/community_hub_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef TypeDef = Function();

Future<ApiResult<T>> dioInterceptor<T>(TypeDef func) async {
  try {
    final result = await func();
    return ApiResult.success(data: result);
  }
  //SERVERPOD EXCEPTION
  on ServerpodClientException catch (exception) {
    return ApiResult.apiFailure(
        error: ApiExceptions.defaultError(exception.message),
        statusCode: exception.statusCode);
  } on DioException catch (exception) {
    // log(exception.response.toString());
    return exception.response?.statusCode == 400 ||
            exception.response?.data['message'] != null
        ? ApiResult.apiFailure(
            error: ApiExceptions.defaultError(
                exception.response?.data['message'] is List
                    ? exception.response?.data['message'][0]
                    : exception.response?.data['message']),
            statusCode: 400)
        : ApiResult.apiFailure(
            error: ApiExceptions.getDioException(exception)!,
            statusCode: exception.response?.statusCode ?? -1);
  } on Error catch (e) {
    debugPrint(e.stackTrace.toString());
    return ApiResult.apiFailure(
        error: ApiExceptions.getDioException(e)!, statusCode: -1);
  } catch (e) {
    debugPrint(e.toString());
    return ApiResult.apiFailure(
        error: ApiExceptions.getDioException(e)!, statusCode: -1);
  }
}
