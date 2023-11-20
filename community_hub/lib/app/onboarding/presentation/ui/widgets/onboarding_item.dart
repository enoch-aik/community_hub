import 'package:community_hub/app/onboarding/data/models/onboarding_model.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/widgets/margin.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          model.imagePath,
          height: 452.h,
          width: 375.w,
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
        ColSpacing(24.h),
      ],
    );
  }
}
