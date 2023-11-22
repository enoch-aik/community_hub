import 'package:community_hub/app/auth/data/models/worker.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';
import 'package:community_hub/app/dashboard/providers.dart';
import 'package:community_hub/core/dependency_injection/di_providers.dart';
import 'package:community_hub/core/service_exceptions/src/api_exceptions.dart';
import 'package:community_hub/core/services/calendar/add_event_to_calendar.dart';
import 'package:community_hub/lib.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

@RoutePage(name: 'bookService')
class BookServiceScreen extends HookConsumerWidget {
  final LocalDbWorker worker;

  const BookServiceScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User currentUser = ref.watch(firebaseAuthProvider).currentUser!;
    DateTime now = DateTime.now();
    List<DateTimeRange> converted = [];
    getBookingStream({required DateTime end, required DateTime start}) {
      if (!worker.fromLocalDb!) {
        return Stream.value(worker);
      }
      return Stream.value([]);
    }

    Future<dynamic> uploadBooking({required BookingService newBooking}) async {
      Booking booking = Booking(
          bookingStart: newBooking.bookingStart,
          bookingEnd: newBooking.bookingEnd,
          clientId: currentUser.uid,
          clientEmail: currentUser.email,
          workerId: worker.id,
          workerName: worker.name,
          workerEmail: worker.email,
          service: worker.service,
          clientName: currentUser.displayName ?? currentUser.email);
      final result = await ref.read(bookingRepoProvider).bookService(
          booking: booking, worker: worker, clientEmail: currentUser.email!);
      result.when(success: (data) {
        //go to home screen
        AutoRouter.of(context).popUntilRoot();
        //add appointment to calendar
        //show dialog to notify user that the appointment has been booked and ask if they want to add it to calendar
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: const Text('Booking complete'),
            content: const Text(
                'Your appointment has been booked successfully, do you want to add this appointment to your Calendar?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle().copyWith(color: context.outline),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await CalendarService().addToCalendar(booking: booking);
                },
                child: Text(
                  'Yes',
                  style: TextStyle().copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      }, apiFailure: (e, _) {
        //show snackbar to notify user that the appointment failed
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: KText(
                'Failed to book appointment: ${ApiExceptions.getErrorMessage(e)}')));
      });
    }

    List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
      //if the result is doctor and not null, show the doctor's schedule, else show an empty schedule
      if (streamResult is Worker) {
        converted = streamResult.scheduleRangeList.toList();
        return streamResult.scheduleRangeList;
      } else {
        return [];
      }
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
