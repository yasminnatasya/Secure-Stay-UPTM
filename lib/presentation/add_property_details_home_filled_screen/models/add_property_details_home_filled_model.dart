import '../../../core/app_export.dart';
import 'icadd_item_model.dart';

/// This class defines the variables used in the [add_property_details_home_filled_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddPropertyDetailsHomeFilledModel {
  Rx<List<IcaddItemModel>> icaddItemList =
      Rx([IcaddItemModel(icAdd: ImageConstant.add.obs)]);
}
