import 'package:dio/dio.dart';

//used to check api response
Future<void> apiResponseChecker(Response<dynamic> response,
    {bool fromServerpod = false}) async {
  if (!fromServerpod) {
    bool isSuccess = response.data['result'] == true;
    if (!isSuccess) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: response.data['error']);
    }
  }
}
