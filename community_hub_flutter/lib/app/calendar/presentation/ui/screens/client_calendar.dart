import 'package:community_hub/app/calendar/data/models/custom_booking.dart';
import 'package:community_hub/app/dashboard/providers.dart';
import 'package:community_hub/core/dependency_injection/di_providers.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/extensions/custom_booking.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage(name: 'clientCalendar')
class ClientCalendarScreen extends HookConsumerWidget {
  const ClientCalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(clientBookingStreamProvider(
        ref.read(firebaseAuthProvider).currentUser!.email!));
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: appointments.when(
              data: (data) {
                return getScheduleViewCalendar(
                    scheduleViewBuilder: scheduleViewBuilder,
                    context: context,
                    sources:
                        data.bookings.toSyncfusionAppointment(isWorker: false));
              },
              error: (e, _) {
                return getScheduleViewCalendar(
                    context: context,
                    scheduleViewBuilder: scheduleViewBuilder,
                    sources: []);
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }

  SfCalendar getScheduleViewCalendar(
      {dynamic scheduleViewBuilder,
      required List<CustomBooking> sources,
      required BuildContext context}) {
    return SfCalendar(
      showDatePickerButton: true,
      scheduleViewMonthHeaderBuilder: scheduleViewBuilder,
      view: CalendarView.schedule,
      //onTap: onAppointmentTap,
      firstDayOfWeek: 1,
      dataSource: _DataSource(sources),
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

Widget scheduleViewBuilder(
    BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
  final String monthName = _getMonthDate(details.date.month);
  return Stack(
    children: <Widget>[
      Image(
          image: ExactAssetImage('assets/images/$monthName.png'),
          fit: BoxFit.cover,
          width: details.bounds.width,
          height: details.bounds.height),
      Positioned(
        left: 55,
        right: 0,
        top: 20,
        bottom: 0,
        child: Text(
          '$monthName ${details.date.year}',
          style: const TextStyle(fontSize: 18),
        ),
      )
    ],
  );
}

/// Returns the month name based on the month value passed from date.
String _getMonthDate(int month) {
  if (month == 01) {
    return 'January';
  } else if (month == 02) {
    return 'February';
  } else if (month == 03) {
    return 'March';
  } else if (month == 04) {
    return 'April';
  } else if (month == 05) {
    return 'May';
  } else if (month == 06) {
    return 'June';
  } else if (month == 07) {
    return 'July';
  } else if (month == 08) {
    return 'August';
  } else if (month == 09) {
    return 'September';
  } else if (month == 10) {
    return 'October';
  } else if (month == 11) {
    return 'November';
  } else {
    return 'December';
  }
}
