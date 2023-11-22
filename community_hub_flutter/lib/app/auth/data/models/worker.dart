import 'dart:math';

import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker.g.dart';

@JsonSerializable(explicitToJson: true)
class Worker {
  final String fullName;
  final String emailAddress;
  String? userId;
  final String service;
  final List<Booking> bookings;
  final bool isApproved;
  final String? fcmToken;

  List<DateTimeRange> get scheduleRangeList =>
      bookings.map((e) => e.toDateTimeRange).toList();

  List<Booking> get upcomingAppointments => bookings
      .where((element) => element.bookingStart!.isAfter(DateTime.now()))
      .toList();

  //check if a userId has booked an upcoming appointment

  bool hasPatientBookedPreviously(String patientId) {
    return upcomingAppointments.any((element) => element.clientId == patientId);
  }

  Worker(
      {required this.fullName,
      required this.emailAddress,
      this.bookings = const [],
      required this.service,
      this.isApproved = false,
      this.fcmToken,
      this.userId});

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);

  LocalDbWorker toLocalWorkerDb() {
    Random random = Random();

    return LocalDbWorker(
        id: random.nextInt(100),
        bookings: bookings,
        name: fullName,
        fromLocalDb: false,
        price: random.nextInt(35),
        email: emailAddress,
        service: service,
        rating: 3.1 + random.nextInt(1),
        type: CommunityServiceType.ac,
        fcmToken: fcmToken);
  }
}
