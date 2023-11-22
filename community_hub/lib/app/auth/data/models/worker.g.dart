// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Worker _$WorkerFromJson(Map<String, dynamic> json) => Worker(
      fullName: json['fullName'] as String,
      emailAddress: json['emailAddress'] as String,
      appointments: (json['appointments'] as List<dynamic>?)
              ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      service: json['service'] as String,
      isApproved: json['isApproved'] as bool? ?? false,
      fcmToken: json['fcmToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'userId': instance.userId,
      'service': instance.service,
      'appointments': instance.appointments.map((e) => e.toJson()).toList(),
      'isApproved': instance.isApproved,
      'fcmToken': instance.fcmToken,
    };
