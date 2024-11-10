import '../../../core/app_export.dart';

/// This class defines the variables used in the [onboarding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingModel {
  String imageUrl;
  String text;
  String subTittle;

  OnboardingModel(
      {required this.imageUrl, required this.text, required this.subTittle});

  static List<OnboardingModel> pages = [
    OnboardingModel(
      imageUrl: ImageConstant.img01OnboardingScreen,
      text: "Searching for the perfect student accommodation?",
      subTittle:
          'Explore affordable options near your university with great amenities!',
    ),
    OnboardingModel(
      imageUrl: ImageConstant.img02OnboardingScreen,
      text: "Find your home away from home.",
      subTittle:
          'Comfortable living spaces designed for student needs and budgets.',
    ),
    OnboardingModel(
      imageUrl: ImageConstant.img03OnboardingScreen,
      text: "Ready to move closer to your campus?",
      subTittle:
          'Check out our listings close to major universities with easy campus access.',
    ),
  ];
}
