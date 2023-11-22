import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_hub/core/api/fcm.dart';
import 'package:community_hub/core/api/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<FirebaseAuth> firebaseAuthProvider =
    Provider((ref) => FirebaseAuth.instance);
final Provider<FirebaseApp?> firebaseAppProvider =
    Provider<FirebaseApp?>((ref) => null);
final Provider<FirebaseFirestore> firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

//provider for firebase api
final Provider<FirebaseApi> firebaseApiProvider =
    Provider((ref) => FirebaseApi(ref.watch(firestoreProvider)));

final isLoggedIn = StateProvider<bool>((ref) {
  return ref.watch(firebaseAuthProvider).currentUser != null;
});

//provider for firebase cloud messaging service
final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService(
      serverKey:
          'AAAAgf3fSFo:APA91bEYw_m4HG-PrkXs9NAVDe2-erN9nBv_V9sN8QcQyRcDzs2P9p9oIhJfPxLgRVmFIgRsvXOcb5dTzDOdkl5MHfg7ihfSMBnv1GWN2M2oDSTqmbo-Qloflhpt10iov5WOXWyxgIRj');
});
