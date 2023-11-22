import 'package:community_hub/app/onboarding/data/models/onboarding_model.dart';
import 'package:community_hub/app/onboarding/presentation/ui/widgets/onboarding_item.dart';
import 'package:community_hub/app/onboarding/presentation/ui/widgets/page_indicator.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/assets.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

@RoutePage(name: 'onboarding')
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const ColSpacing(40),
                SizedBox(
                  height: 480.h,
                  //width: 530.w,
                  child: PageView.builder(
                    itemCount: OnboardingModel.appOnboarding.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) => AnimatedScale(
                      scale: currentPage == index ? 1.0 : 0.2,
                      duration: const Duration(milliseconds: 400),
                      child: OnboardingItem(
                          model: OnboardingModel.appOnboarding[index]),
                    ),
                  ),
                ),
                OnBoardingPageIndicator(
                    currentPage: currentPage,
                    totalPages: OnboardingModel.appOnboarding.length),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: KText(
                          OnboardingModel.appOnboarding[currentPage].title,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                          fontSize: 26.sp,
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                        child: KText(
                          OnboardingModel
                              .appOnboarding[currentPage].description,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          color: context.outline,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: context.background,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        width: double.maxFinite,
        child: FilledButton(
            onPressed: () {
              AppNavigator.of(context).replace(Login());
            },
            child: const Text('Get Started')),
      ),
    );
  }
}
