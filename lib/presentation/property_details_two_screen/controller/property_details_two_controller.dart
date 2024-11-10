import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/property_details_two_screen/models/property_details_two_model.dart';

/// A controller class for the PropertyDetailsTwoScreen.
///
/// This class manages the state of the PropertyDetailsTwoScreen, including the
/// current propertyDetailsTwoModelObj
class PropertyDetailsTwoController extends GetxController {
  Rx<PropertyDetailsTwoModel> propertyDetailsTwoModelObj =
      PropertyDetailsTwoModel().obs;
}
