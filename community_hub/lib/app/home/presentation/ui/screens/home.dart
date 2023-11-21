import 'package:community_hub/app/bookings/presentation/ui/screens/client_booking.dart';
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
    List<Widget> body = const [
      DashboardScreen(),
      ClientBookingScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: body[ref.watch(clientSelectedIndexProvider)],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          onTap: (index) {
            ref.read(clientSelectedIndexProvider.notifier).state = index;
          },
          currentIndex: ref.watch(clientSelectedIndexProvider),
          items: navItems,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

const List<BottomNavigationBarItem> navItems = [
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
