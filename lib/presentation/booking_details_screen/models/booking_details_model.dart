import '../../../core/app_export.dart';import 'adults_item_model.dart';/// This class defines the variables used in the [booking_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookingDetailsModel {Rx<List<AdultsItemModel>> adultsItemList = Rx([AdultsItemModel(adults: "Adults".obs,duration: "After 12 years".obs,two: "02".obs),AdultsItemModel(adults: "Children".obs,duration: "0-12 years".obs,two: "01".obs)]);

 }
