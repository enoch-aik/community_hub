import 'package:auto_route/auto_route.dart';
import 'package:community_hub/app/auth/presentation/ui/screens/login.dart';
import 'package:community_hub/app/auth/presentation/ui/screens/signup.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/all_categories.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/dashboard.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/services/book_service.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/services/service_details.dart';
import 'package:community_hub/app/dashboard/presentation/ui/screens/services/service_list.dart';
import 'package:community_hub/app/onboarding/presentation/ui/screens/onboarding.dart';
import 'package:community_hub/app/splash/presentation/ui/screens/splash.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: Splash.page, initial: true),
        AutoRoute(path: '/onboarding', page: Onboarding.page),
        AutoRoute(path: '/login', page: Login.page),
        AutoRoute(path: '/signup', page: Signup.page),
        AutoRoute(path: '/dashboard', page: Dashboard.page),
        AutoRoute(path: '/allCategories', page: AllCategories.page),
        AutoRoute(path: '/serviceList', page: ServiceList.page),
        AutoRoute(path: '/serviceDetails', page: ServiceDetails.page),
        AutoRoute(path: '/bookService', page: BookService.page),


      ];

  Route<T> modalSheetBuilder<T>(
      BuildContext context, Widget child, AutoRoutePage<T> page) {
    return ModalBottomSheetRoute(
        builder: (context) => child, isScrollControlled: false);
  }
}
