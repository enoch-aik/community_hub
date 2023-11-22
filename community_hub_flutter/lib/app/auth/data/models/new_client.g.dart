// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewClient _$NewClientFromJson(Map<String, dynamic> json) => NewClient(
      fullName: json['fullName'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      fcmToken: json['fcmToken'] as String?,
      bookings: (json['bookings'] as List<dynamic>?)
              ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$NewClientToJson(NewClient instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'userId': instance.userId,
      'bookings': instance.bookings,
      'fcmToken': instance.fcmToken,
    };
