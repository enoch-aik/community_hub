import 'package:community_hub/src/res/assets/assets.dart';

class OnboardingModel {
  final String imagePath;
  final String description;
  final String title;

  OnboardingModel(
      {required this.imagePath,
      required this.description,
      required this.title});

  static List<OnboardingModel> get appOnboarding => [
        OnboardingModel(
            imagePath: AppAssets.onboarding1,
            title: 'Welcome to our Community Hub!',
            description: 'Easy access to all your community needs.'),
        OnboardingModel(
            imagePath: AppAssets.onboarding2,
            title: 'Get access to quality services in your community.',
            description: 'Find plumbers, electricians, carpenters, etc.'),
        OnboardingModel(
            imagePath: AppAssets.onboarding3,
            description: 'Life just became easier with Community Hub',
            title: 'Many services and more'),
      ];
}
