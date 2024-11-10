import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/delete_address_dialog/models/delete_address_model.dart';

/// A controller class for the DeleteAddressDialog.
///
/// This class manages the state of the DeleteAddressDialog, including the
/// current deleteAddressModelObj
class DeleteAddressController extends GetxController {
  Rx<DeleteAddressModel> deleteAddressModelObj = DeleteAddressModel().obs;
}
