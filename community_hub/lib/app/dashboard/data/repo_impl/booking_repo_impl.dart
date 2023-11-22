import 'package:community_hub/app/dashboard/data/data_source/booking_datasource.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/app/dashboard/domain/repo/booking_repo.dart';
import 'package:community_hub/core/helpers/dio_interceptor.dart';
import 'package:community_hub/core/service_result/src/api_result.dart';
import 'package:community_hub/src/mock/database/services.dart';

class BookingRepoImpl extends BookingRepo {
  final BookingDataSource bookingDataSource;

  BookingRepoImpl(this.bookingDataSource);

  @override
  Future<ApiResult<bool>> bookService(
          {required Booking booking,
          required LocalDbWorker worker,
          required String clientEmail}) =>
      apiInterceptor(() => bookingDataSource.bookService(
          booking: booking, worker: worker, clientEmail: clientEmail));
}
