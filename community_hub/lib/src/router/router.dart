import 'package:auto_route/auto_route.dart';
import 'package:community_hub/app/splash/presentation/ui/screens/splash.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: Splash.page, initial: true),
      ];

  Route<T> modalSheetBuilder<T>(
      BuildContext context, Widget child, AutoRoutePage<T> page) {
    return ModalBottomSheetRoute(
        builder: (context) => child, isScrollControlled: false);
  }
}
