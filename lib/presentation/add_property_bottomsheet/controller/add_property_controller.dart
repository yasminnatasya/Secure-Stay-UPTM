import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_bottomsheet/models/add_property_model.dart';

/// A controller class for the AddPropertyBottomsheet.
///
/// This class manages the state of the AddPropertyBottomsheet, including the
/// current addPropertyModelObj
class AddPropertyController extends GetxController {
  Rx<AddPropertyModel> addPropertyModelObj = AddPropertyModel().obs;
}
