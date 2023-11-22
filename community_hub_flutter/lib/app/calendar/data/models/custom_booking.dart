
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart'
as syncfusion_appointment;

class CustomBooking extends syncfusion_appointment.Appointment {
  final Booking booking;

  CustomBooking(
      {required this.booking,
        required super.startTime,
        required super.endTime,
        required super.subject,
        required super.notes,
        required super.color})
      : super();
}
