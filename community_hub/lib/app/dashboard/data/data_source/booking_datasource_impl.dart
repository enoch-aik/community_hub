import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_hub/app/auth/data/models/client.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/core/api/fcm.dart';
import 'package:community_hub/core/api/firebase.dart';
import 'package:community_hub/src/extensions/date_range.dart';
import 'package:community_hub/src/mock/database/services.dart';

import 'booking_datasource.dart';

class BookingDataSourceImpl extends BookingDataSource {
  final FirebaseFirestore firestore;
  final FirebaseApi firebaseApi;
  final FCMService fcmService;

  BookingDataSourceImpl(this.firestore, this.firebaseApi, this.fcmService);

  @override
  Future<bool> bookService(
      {required Booking booking,
      required LocalDbWorker worker,
      required String clientEmail}) async {
    bool updated = false;
    //update doctors' appointment
    DocumentReference workerDbRef =
        firestore.collection('workers').doc(worker.email);
    //update patient's appointment
    DocumentReference clientDbRef =
        firestore.collection('clients').doc(clientEmail);

    Client client = await firebaseApi.getClientData(clientEmail);
    await clientDbRef.update({
      'appointments':
          [booking, ...client.bookings].map((e) => e.toJson()).toList()
    });
    await workerDbRef.update({
      'appointments':
          [booking, ...?worker.bookings].map((e) => e.toJson()).toList()
    });
    updated = true;

    //send notification to doctor
    try {
      await fcmService.sendNotification(
          recipientFCMToken: worker.fcmToken ?? '',
          body:
              '${booking.clientName} just booked an appointment with you ${booking.toDateTimeRange.formatToInfoDateTime()}',
          title: 'You have a new appointment!');
    } catch (_) {}

    return updated;
  }
}
