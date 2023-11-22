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
  final String speciality;
  final bool isApproved;
  final List<Booking> appointments;
  final String? fcmToken;

  NewWorker(
      {required this.fullName,
      required this.emailAddress,
      required this.password,
      this.appointments = const [],
      this.isApproved = false,
      required this.speciality,
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
      appointments: [],
      service: speciality);
}
