import 'dart:math';

import 'package:community_hub/app/calendar/data/models/custom_booking.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:flutter/animation.dart';

extension BookingList on List<Booking> {
  List<Color> get colorCollection => const <Color>[
        Color(0xFF0F8644),
        Color(0xFF8B1FA9),
        Color(0xFFD20100),
        Color(0xFFFC571D),
        Color(0xFF36B37B),
        Color(0xFF01A1EF),
        Color(0xFF3D4FB5),
        Color(0xFFE47C73),
        // Color(0xFF636363),
        Color(0xFF0A8043)
      ];

  List<CustomBooking> toSyncfusionAppointment({bool isWorker = true}) {
    final Random random = Random();
    return map((e) => CustomBooking(
          booking: e,
          subject:
              'Appointment with ${isWorker ? e.clientName ?? 'a Client' : e.workerName!}',
          startTime: e.bookingStart!,
          endTime: e.bookingEnd!,
          notes: '',
          color: e.bookingEnd!.isBefore(DateTime.now())
              ? const Color(0xFF636363)
              : colorCollection[random.nextInt(8)],
          /*recurrenceRule: 'FREQ=DAILY;INTERVAL=10'*/
        )).toList();
  }
}
