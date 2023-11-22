import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable(explicitToJson: true)
class Client {
  final String fullName;
  final String emailAddress;
  String? userId;
  final List<Booking> bookings;
  final String? fcmToken;

  Client(
      {required this.fullName,
      required this.emailAddress,
      this.bookings = const [],
      this.fcmToken,
      this.userId});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  List<Booking> get upcomingBookings => bookings
      .where((element) => element.bookingStart!.isAfter(DateTime.now()))
      .toList();
}
