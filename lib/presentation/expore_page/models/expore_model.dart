import 'locationgrid_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [expore_page],
/// and is typically used to hold data that is passed between different parts of the application.

/// This class defines the variables used in the [recommended_for_you_screen],
/// and is typically used to hold data that is passed between different parts of the application.

List<LocationIdItemModel> locationIdItemModelItemList = [
  LocationIdItemModel(
    id: "1", // Added a unique id for this item
    image: ImageConstant.imgRectangle17858,
    name: "Sherman Oaks",
    address: "123 Main St, Sherman Oaks, Los Angeles, CA", // Example address
    price: "\$40",
    type: "/mo",
    bed: "02",
    bathtub: "03",
    sqft: "2468 sqft",
    isFavourite: false,
    latitude: 3.1390, // Example latitude for Sherman Oaks
    longitude: 101.6869, // Example longitude for Sherman Oaks
    distance: 5.0, // Example distance in km
  ),
  LocationIdItemModel(
    id: "2", // Added a unique id for this item
    image: ImageConstant.search2,
    name: "Sherman Oaks",
    address: "456 Oak Ave, Sherman Oaks, Los Angeles, CA", // Example address
    price: "\$40",
    type: "/mo",
    bed: "02",
    bathtub: "03",
    sqft: "2468 sqft",
    isFavourite: false,
    latitude: 3.1395, // Example latitude for Sherman Oaks
    longitude: 101.6875, // Example longitude for Sherman Oaks
    distance: 5.2, // Example distance in km
  ),
];
