import 'package:auto_route/annotations.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/assets.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

@RoutePage(name: 'splash')
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void redirect() {
    Future.delayed(const Duration(seconds: 3), () async {
      AppNavigator.of(context).replace(const Onboarding());
    });
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Center(
        child: SvgPicture.asset(AppAssets.logoSvg),
      ),
    );
  }
}
