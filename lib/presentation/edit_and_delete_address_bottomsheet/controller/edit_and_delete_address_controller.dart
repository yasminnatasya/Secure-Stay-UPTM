import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/edit_and_delete_address_bottomsheet/models/edit_and_delete_address_model.dart';

/// A controller class for the EditAndDeleteAddressBottomsheet.
///
/// This class manages the state of the EditAndDeleteAddressBottomsheet, including the
/// current editAndDeleteAddressModelObj
class EditAndDeleteAddressController extends GetxController {
  Rx<EditAndDeleteAddressModel> editAndDeleteAddressModelObj =
      EditAndDeleteAddressModel().obs;
}
