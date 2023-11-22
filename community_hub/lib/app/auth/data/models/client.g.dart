// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      fullName: json['fullName'] as String,
      emailAddress: json['emailAddress'] as String,
      bookings: (json['bookings'] as List<dynamic>?)
              ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fcmToken: json['fcmToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'userId': instance.userId,
      'bookings': instance.bookings.map((e) => e.toJson()).toList(),
      'fcmToken': instance.fcmToken,
    };
