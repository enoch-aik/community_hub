import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_hub/app/auth/data/models/worker.dart';
import 'package:community_hub/app/dashboard/data/data_source/booking_datasource.dart';
import 'package:community_hub/app/dashboard/data/data_source/booking_datasource_impl.dart';
import 'package:community_hub/app/dashboard/data/repo_impl/booking_repo_impl.dart';
import 'package:community_hub/app/dashboard/domain/repo/booking_repo.dart';
import 'package:community_hub/core/dependency_injection/di_providers.dart';
import 'package:community_hub/lib.dart';

/// workers data stream provider
final acRepairListStreamProvider = StreamProvider<List<Worker>>((ref) {
  return FirebaseFirestore.instance
      .collection('workers')
      .snapshots()
      .map((querySnapshot) {
    return querySnapshot.docs.map((e) => Worker.fromJson(e.data())).toList();
  });
});

final bookingDataSourceProvider = Provider<BookingDataSource>((ref) {
  return BookingDataSourceImpl(ref.read(firestoreProvider),
      ref.read(firebaseApiProvider), ref.read(fcmServiceProvider));
});
final bookingRepoProvider = Provider<BookingRepo>(
        (ref) => BookingRepoImpl(ref.read(bookingDataSourceProvider)));
