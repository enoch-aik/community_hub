import 'package:community_hub/lib.dart';
import 'package:booking_calendar/booking_calendar.dart';

@RoutePage(name: 'bookService')
class BookServiceScreen extends HookConsumerWidget {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    List<DateTimeRange> converted = [];
    getBookingStream({required DateTime end, required DateTime start}) {
      return Stream.value([]);

      /*return ref.watch(doctorScheduleStreamProvider(doctor.emailAddress)).when(
          data: (data) {

            doctorData.value = data;
            return Stream.value(data);
          },
          error: (e, _) {
            return Stream.value(null);
          },
          loading: () => Stream.value(null));*/
    }

    Future<dynamic> uploadBooking({required BookingService newBooking}) async {}
    List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
      /* //if the result is doctor and not null, show the doctor's schedule, else show an empty schedule
      if (streamResult is Doctor) {
        converted = streamResult.scheduleRangeList.toList();
        return streamResult.scheduleRangeList;
      } else {
        return [];
      }*/
      return [];
    }

    return Scaffold(
      appBar: AppBar(
        title: KText(
          'Book service',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: BookingCalendar(
        key: key,
        bookingGridCrossAxisCount: 4,
        getBookingStream: getBookingStream,
        uploadBooking: uploadBooking,
        convertStreamResultToDateTimeRanges: convertStreamResult,
        uploadingWidget: const Center(
          child: CircularProgressIndicator(),
        ),
        pauseSlotColor: context.outlineVariant,
        availableSlotColor: context.primary,
        availableSlotTextStyle:
            const TextStyle().copyWith(color: context.onPrimary),
        pauseSlots: const [],
        //get120Days(),
        hideBreakTime: false,
        selectedSlotColor: context.primaryContainer,
        bookingButtonColor: context.primary,
        bookingButtonText: 'Book Appointment',
        disabledDays: const [],
        bookingService: BookingService(
            serviceName: 'Appointments',
            userEmail: '',
            userId: 'dj',
            serviceDuration: 30,
            bookingEnd: DateTime(now.year, now.month, now.day, 23, 0),
            bookingStart: DateTime(now.year, now.month, now.day, 8, 0)),
      ),
    );
  }
}
