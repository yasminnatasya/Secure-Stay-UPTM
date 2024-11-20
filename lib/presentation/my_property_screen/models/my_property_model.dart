import '../../../core/app_export.dart';
import 'bedroomlist_item_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

/// This class defines the variables used in the [my_property_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MyPropertyModel {
  Rx<List<BedroomlistItemModel>> bedroomlistItemList =
      Rx<List<BedroomlistItemModel>>([]);

  MyPropertyModel(); // Empty constructor
}
