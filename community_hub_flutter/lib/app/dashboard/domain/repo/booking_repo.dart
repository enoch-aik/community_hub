

import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/core/service_result/src/api_result.dart';
import 'package:community_hub/src/mock/database/services.dart';

abstract class BookingRepo {
  Future<ApiResult<bool>> bookService(
      {required Booking booking,
      required LocalDbWorker worker,
      required String clientEmail});
}
