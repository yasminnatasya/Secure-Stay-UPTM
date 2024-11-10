import '../../../core/app_export.dart';

/// This class is used in the [onboardingslider_item_widget] screen.

class OnboardingsliderItemModel {
  OnboardingsliderItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
