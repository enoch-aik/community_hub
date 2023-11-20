import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: context.primary ,
      body: Center(child: SvgPicture.asset(AppAssets.logoSvg),),
    );
  }
}
