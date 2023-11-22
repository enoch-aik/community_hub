import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/src/mock/database/services.dart';

abstract class BookingDataSource {
  Future<bool> bookService(
      {required Booking booking,
      required LocalDbWorker worker,
      required String clientEmail});

}
