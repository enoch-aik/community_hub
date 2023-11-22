import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_hub/app/auth/data/models/client.dart';
import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/data/models/new_worker.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final FirebaseFirestore firestore;
  late CollectionReference bookings;

  FirebaseApi(this.firestore) {
    bookings = firestore.collection('bookings');
  }

  Future<bool> storeClientData(
      {required NewClient newUser, required UserCredential credential}) async {
    newUser.userId = credential.user!.uid;
    await firestore
        .collection('clients')
        .doc(credential.user!.email)
        .set(newUser.toJson())
        .onError((error, stackTrace) => false);
    return true;
  }

  Future<bool> storeWorkerData(
      {required NewWorker newWorker,
      required UserCredential credential}) async {
    newWorker.userId = credential.user!.uid;
    await firestore
        .collection('workers')
        .doc(credential.user!.email)
        .set(newWorker.toJson())
        .onError((error, stackTrace) => false);
    return true;
  }

  ///check if user exist
  Future<bool> getClient(String email) async {
    // bool exists = false;
    var doc = await firestore.collection('clients').doc(email).get();
    return doc.exists;
  }

  Future<Client> getClientData(String email) async {
    DocumentReference docRef = firestore.collection('clients').doc(email);
    return Client.fromJson(await docRef
        .get()
        .then((value) => value.data()! as Map<String, dynamic>));
  }

  //check if client exists
  Future<bool> getWorker(String email) async {
    bool exists = false;
    var doc = await firestore.collection('workers').doc(email).get();
    exists = doc.exists;
    return exists;
  }

  Future<Client> getWorkerData(String email) async {
    DocumentReference docRef = firestore.collection('workers').doc(email);
    return Client.fromJson(await docRef
        .get()
        .then((value) => value.data()! as Map<String, dynamic>));
  }

  CollectionReference<Booking> getBookingStream({required String docId}) {
    return bookings.doc(docId).collection('bookings').withConverter<Booking>(
          fromFirestore: (snapshots, _) => Booking.fromJson(snapshots.data()!),
          toFirestore: (snapshots, _) => snapshots.toJson(),
        );
  }

  Stream<dynamic>? getBookingStreamFirebase(
      {required DateTime end, required DateTime start}) {
    return getBookingStream(docId: 'YOUR_DOC_ID')
        .where('bookingStart', isGreaterThanOrEqualTo: start)
        .where('bookingStart', isLessThanOrEqualTo: end)
        .snapshots();
  }

  List<DateTimeRange> convertStreamResultFirebase(
      {required dynamic streamResult}) {
    List<DateTimeRange> converted = [];
    for (var i = 0; i < streamResult.size; i++) {
      final item = streamResult.docs[i].data();
      converted.add(
          DateTimeRange(start: (item.bookingStart!), end: (item.bookingEnd!)));
    }
    return converted;
  }

  Future<dynamic> uploadBookingFirebase(
      {required Booking newAppointment}) async {
    await bookings
        .doc('your id, or autogenerate')
        .collection('bookings')
        .add(newAppointment.toJson())
        .then((value) => print("Booking Added"))
        .catchError((error) => print("Failed to add booking: $error"));
  }
}
