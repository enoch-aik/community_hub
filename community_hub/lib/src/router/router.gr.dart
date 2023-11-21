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
    AllCategories.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllCategoriesScreen(),
      );
    },
    Dashboard.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
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
    Signup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    Splash.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
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
/// [ServiceDetailsScreen]
class ServiceDetails extends PageRouteInfo<ServiceDetailsArgs> {
  ServiceDetails({
    Key? key,
    required Worker worker,
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

  final Worker worker;

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
    required List<Worker> workers,
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

  final List<Worker> workers;

  final String title;

  @override
  String toString() {
    return 'ServiceListArgs{key: $key, workers: $workers, title: $title}';
  }
}

/// generated route for
/// [SignupScreen]
class Signup extends PageRouteInfo<void> {
  const Signup({List<PageRouteInfo>? children})
      : super(
          Signup.name,
          initialChildren: children,
        );

  static const String name = 'Signup';

  static const PageInfo<void> page = PageInfo<void>(name);
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
