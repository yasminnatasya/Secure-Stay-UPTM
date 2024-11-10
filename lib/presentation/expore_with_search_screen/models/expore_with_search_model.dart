import 'ichome_item_model.dart';import '../../../core/app_export.dart';/// This class defines the variables used in the [expore_with_search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ExporeWithSearchModel {Rx<List<IchomeItemModel>> ichomeItemList = Rx(List.generate(6,(index) => IchomeItemModel()));

 }
