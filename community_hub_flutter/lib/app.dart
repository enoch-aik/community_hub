import 'package:community_hub/src/observers/navigation.dart';
import 'package:community_hub/src/providers.dart';
import 'package:community_hub/src/res/theme/theme.dart';

import 'lib.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouter);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Community Hub',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            routeInformationParser: router.defaultRouteParser(),
            routeInformationProvider: router.routeInfoProvider(),
            routerDelegate: AutoRouterDelegate(
              router,
              navigatorObservers: () => [
                AppRouteObservers(),
              ],
            ),
            backButtonDispatcher: RootBackButtonDispatcher(),
          );
        },
      ),
    );
  }
}
