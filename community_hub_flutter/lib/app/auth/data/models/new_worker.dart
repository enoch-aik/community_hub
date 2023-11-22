import 'package:community_hub/app/auth/data/models/worker.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_worker.g.dart';

@JsonSerializable()
class NewWorker {
  final String fullName;
  final String emailAddress;
  final String password;
  String? userId;
  final String service;
  final bool isApproved;
  final List<Booking> bookings;
  final String? fcmToken;

  NewWorker(
      {required this.fullName,
      required this.emailAddress,
      required this.password,
      this.bookings = const [],
      this.isApproved = false,
      required this.service,
      this.fcmToken,
      this.userId});

  factory NewWorker.fromJson(Map<String, dynamic> json) =>
      _$NewWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$NewWorkerToJson(this);

  Worker toWorker() => Worker(
      fullName: fullName,
      emailAddress: emailAddress,
      userId: userId,
      fcmToken: fcmToken,
      bookings: [],
      service: service);
}
