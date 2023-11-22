import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_hub/app/calendar/data/models/custom_booking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable(explicitToJson: true)
class Booking extends Equatable {
  /// The generated code assumes these values exist in JSON.
  final String? clientId;
  final String? clientName;
  final int? workerId;
  final String? clientEmail;
  final bool? valid;
  final String? workerName;
  final String? service;
  @JsonKey(includeIfNull: false)
  final String? workerEmail;
  @JsonKey(includeIfNull: false)

  bool get isActive => bookingEnd?.isBefore(DateTime.now()) ?? false;

  static DateTime timeStampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static Timestamp dateTimeToTimeStamp(DateTime? dateTime) {
    return Timestamp.fromDate(dateTime ?? DateTime.now());
  }

  @JsonKey(fromJson: timeStampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime? bookingStart;
  @JsonKey(fromJson: timeStampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime? bookingEnd;

  const Booking(
      {this.bookingStart,
      this.bookingEnd,
      this.clientId,
      this.clientName,
      this.workerEmail,
      this.workerId,
      this.clientEmail,
      this.workerName,
      this.service,
      this.valid = true});

  /// Connect the generated [_$SportBookingFromJson] function to the `fromJson`
  /// factory.
  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  /// Connect the generated [_$SportBookingToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BookingToJson(this);

  //convert appointment to DateTimerRange
  DateTimeRange get toDateTimeRange =>
      DateTimeRange(start: bookingStart!, end: bookingEnd!);

  @override
  // TODO: implement props
  List<Object?> get props => [
        bookingStart,
        bookingEnd,
        clientId,
        clientName,
        workerEmail,
        valid
      ];
}
