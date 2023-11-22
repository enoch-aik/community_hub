import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';

class CalendarService {
  Future<bool> addToCalendar({required Booking booking}) async {
    return await Add2Calendar.addEvent2Cal(
      Event(
          title: 'Appointment with ${booking.workerName} (${booking.service})',
          startDate: booking.bookingStart!,
          endDate: booking.bookingEnd!,
          iosParams: const IOSParams(reminder: Duration(minutes: 30))),
    );
  }
}
