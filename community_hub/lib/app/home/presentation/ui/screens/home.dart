import 'package:community_hub/app/bookings/presentation/ui/screens/client_booking.dart';
import 'package:community_hub/app/calendar/presentation/ui/screens/client_calendar.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/dashboard.dart';
import 'package:community_hub/app/home/providers.dart';
import 'package:community_hub/app/profile/presentation/ui/screens/profile.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/widgets/bottom_nav_icons.dart';

@RoutePage(name: 'home')
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> clientBody = const [
      DashboardScreen(),
      ClientCalendarScreen(),
      // ClientBookingScreen(),
      ProfileScreen(),
    ];

    List<Widget> workerBody = const [
      ClientCalendarScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: ref.watch(userTypeProvider)
          ? clientBody[ref.watch(clientSelectedIndexProvider)]
          : workerBody[ref.watch(workerSelectedIndexProvider)],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          onTap: (index) {
            ref.read(clientSelectedIndexProvider.notifier).state = index;
          },
          currentIndex: ref.watch(userTypeProvider)
              ? ref.watch(clientSelectedIndexProvider)
              : ref.watch(workerSelectedIndexProvider),
          items: ref.watch(userTypeProvider) ? clientNavItems : workerNavItems,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

const List<BottomNavigationBarItem> clientNavItems = [
  BottomNavigationBarItem(
    icon: Icon(BottomNavIcons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(BottomNavIcons.calendar),
    label: 'Calendar',
  ),
  BottomNavigationBarItem(
    icon: Icon(BottomNavIcons.profile),
    label: 'Profile',
  ),
];

const List<BottomNavigationBarItem> workerNavItems = [
  BottomNavigationBarItem(
    icon: Icon(BottomNavIcons.calendar),
    label: 'Calendar',
  ),
  BottomNavigationBarItem(
    icon: Icon(BottomNavIcons.profile),
    label: 'Profile',
  ),
];
