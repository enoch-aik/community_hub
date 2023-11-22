import 'package:community_hub/app/auth/data/models/client.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_client.g.dart';

@JsonSerializable()
class NewClient {
  final String fullName;
  final String emailAddress;
  final String password;
  String? userId;
  final List<Booking> bookings;
  final String? fcmToken;

  NewClient(
      {required this.fullName,
        required this.emailAddress,
        required this.password,this.fcmToken,
        this.bookings = const [],
        this.userId});

  factory NewClient.fromJson(Map<String, dynamic> json) =>
      _$NewClientFromJson(json);

  Map<String, dynamic> toJson() => _$NewClientToJson(this);

  Client toClient() => Client(
      fullName: fullName,
      emailAddress: emailAddress,
      userId: userId,fcmToken: fcmToken,
      bookings: bookings);
}
