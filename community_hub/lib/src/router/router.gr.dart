// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AcRepairServiceList.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AcRepairServiceListScreen(),
      );
    },
    AllCategories.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllCategoriesScreen(),
      );
    },
    BookService.name: (routeData) {
      final args = routeData.argsAs<BookServiceArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookServiceScreen(
          key: args.key,
          worker: args.worker,
        ),
      );
    },
    ClientBooking.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientBookingScreen(),
      );
    },
    ClientCalendar.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientCalendarScreen(),
      );
    },
    ClientSignup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientSignupScreen(),
      );
    },
    DashboardMap.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardMapScreen(),
      );
    },
    Dashboard.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    Home.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    Login.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    Onboarding.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    Profile.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ServiceDetails.name: (routeData) {
      final args = routeData.argsAs<ServiceDetailsArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceDetailsScreen(
          key: args.key,
          worker: args.worker,
        ),
      );
    },
    ServiceList.name: (routeData) {
      final args = routeData.argsAs<ServiceListArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceListScreen(
          key: args.key,
          workers: args.workers,
          title: args.title,
        ),
      );
    },
    Splash.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WorkerBooking.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkerBookingScreen(),
      );
    },
    WorkerSignup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkerSignupScreen(),
      );
    },
  };
}

/// generated route for
/// [AcRepairServiceListScreen]
class AcRepairServiceList extends PageRouteInfo<void> {
  const AcRepairServiceList({List<PageRouteInfo>? children})
      : super(
          AcRepairServiceList.name,
          initialChildren: children,
        );

  static const String name = 'AcRepairServiceList';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllCategoriesScreen]
class AllCategories extends PageRouteInfo<void> {
  const AllCategories({List<PageRouteInfo>? children})
      : super(
          AllCategories.name,
          initialChildren: children,
        );

  static const String name = 'AllCategories';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookServiceScreen]
class BookService extends PageRouteInfo<BookServiceArgs> {
  BookService({
    Key? key,
    required LocalDbWorker worker,
    List<PageRouteInfo>? children,
  }) : super(
          BookService.name,
          args: BookServiceArgs(
            key: key,
            worker: worker,
          ),
          initialChildren: children,
        );

  static const String name = 'BookService';

  static const PageInfo<BookServiceArgs> page = PageInfo<BookServiceArgs>(name);
}

class BookServiceArgs {
  const BookServiceArgs({
    this.key,
    required this.worker,
  });

  final Key? key;

  final LocalDbWorker worker;

  @override
  String toString() {
    return 'BookServiceArgs{key: $key, worker: $worker}';
  }
}

/// generated route for
/// [ClientBookingScreen]
class ClientBooking extends PageRouteInfo<void> {
  const ClientBooking({List<PageRouteInfo>? children})
      : super(
          ClientBooking.name,
          initialChildren: children,
        );

  static const String name = 'ClientBooking';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClientCalendarScreen]
class ClientCalendar extends PageRouteInfo<void> {
  const ClientCalendar({List<PageRouteInfo>? children})
      : super(
          ClientCalendar.name,
          initialChildren: children,
        );

  static const String name = 'ClientCalendar';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClientSignupScreen]
class ClientSignup extends PageRouteInfo<void> {
  const ClientSignup({List<PageRouteInfo>? children})
      : super(
          ClientSignup.name,
          initialChildren: children,
        );

  static const String name = 'ClientSignup';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardMapScreen]
class DashboardMap extends PageRouteInfo<void> {
  const DashboardMap({List<PageRouteInfo>? children})
      : super(
          DashboardMap.name,
          initialChildren: children,
        );

  static const String name = 'DashboardMap';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class Dashboard extends PageRouteInfo<void> {
  const Dashboard({List<PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class Login extends PageRouteInfo<void> {
  const Login({List<PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class Onboarding extends PageRouteInfo<void> {
  const Onboarding({List<PageRouteInfo>? children})
      : super(
          Onboarding.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class Profile extends PageRouteInfo<void> {
  const Profile({List<PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceDetailsScreen]
class ServiceDetails extends PageRouteInfo<ServiceDetailsArgs> {
  ServiceDetails({
    Key? key,
    required LocalDbWorker worker,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceDetails.name,
          args: ServiceDetailsArgs(
            key: key,
            worker: worker,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceDetails';

  static const PageInfo<ServiceDetailsArgs> page =
      PageInfo<ServiceDetailsArgs>(name);
}

class ServiceDetailsArgs {
  const ServiceDetailsArgs({
    this.key,
    required this.worker,
  });

  final Key? key;

  final LocalDbWorker worker;

  @override
  String toString() {
    return 'ServiceDetailsArgs{key: $key, worker: $worker}';
  }
}

/// generated route for
/// [ServiceListScreen]
class ServiceList extends PageRouteInfo<ServiceListArgs> {
  ServiceList({
    Key? key,
    required List<LocalDbWorker> workers,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceList.name,
          args: ServiceListArgs(
            key: key,
            workers: workers,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceList';

  static const PageInfo<ServiceListArgs> page = PageInfo<ServiceListArgs>(name);
}

class ServiceListArgs {
  const ServiceListArgs({
    this.key,
    required this.workers,
    required this.title,
  });

  final Key? key;

  final List<LocalDbWorker> workers;

  final String title;

  @override
  String toString() {
    return 'ServiceListArgs{key: $key, workers: $workers, title: $title}';
  }
}

/// generated route for
/// [SplashScreen]
class Splash extends PageRouteInfo<void> {
  const Splash({List<PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkerBookingScreen]
class WorkerBooking extends PageRouteInfo<void> {
  const WorkerBooking({List<PageRouteInfo>? children})
      : super(
          WorkerBooking.name,
          initialChildren: children,
        );

  static const String name = 'WorkerBooking';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkerSignupScreen]
class WorkerSignup extends PageRouteInfo<void> {
  const WorkerSignup({List<PageRouteInfo>? children})
      : super(
          WorkerSignup.name,
          initialChildren: children,
        );

  static const String name = 'WorkerSignup';

  static const PageInfo<void> page = PageInfo<void>(name);
}
