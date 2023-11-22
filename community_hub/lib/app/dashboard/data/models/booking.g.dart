// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      bookingStart:
          Booking.timeStampToDateTime(json['bookingStart'] as Timestamp),
      bookingEnd: Booking.timeStampToDateTime(json['bookingEnd'] as Timestamp),
      clientId: json['clientId'] as String?,
      clientName: json['clientName'] as String?,
      workerEmail: json['workerEmail'] as String?,
      workerId: json['workerId'] as int?,
      clientEmail: json['clientEmail'] as String?,
      workerName: json['workerName'] as String?,
      service: json['service'] as String?,
      valid: json['valid'] as bool? ?? true,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) {
  final val = <String, dynamic>{
    'clientId': instance.clientId,
    'clientName': instance.clientName,
    'workerId': instance.workerId,
    'clientEmail': instance.clientEmail,
    'valid': instance.valid,
    'workerName': instance.workerName,
    'service': instance.service,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('workerEmail', instance.workerEmail);
  val['bookingStart'] = Booking.dateTimeToTimeStamp(instance.bookingStart);
  val['bookingEnd'] = Booking.dateTimeToTimeStamp(instance.bookingEnd);
  return val;
}
