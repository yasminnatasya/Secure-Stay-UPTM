import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/property_add_success_dialog/models/property_add_success_model.dart';

/// A controller class for the PropertyAddSuccessDialog.
///
/// This class manages the state of the PropertyAddSuccessDialog, including the
/// current propertyAddSuccessModelObj
class PropertyAddSuccessController extends GetxController {
  Rx<PropertyAddSuccessModel> propertyAddSuccessModelObj =
      PropertyAddSuccessModel().obs;
}
