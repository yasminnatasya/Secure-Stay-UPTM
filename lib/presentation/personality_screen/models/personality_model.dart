import 'chipview_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [personality_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PersonalityModel {
  Rx<List<ChipViewItemModel>> chipViewItemList =
      Rx(List.generate(21, (index) => ChipViewItemModel(tag: 'Calm',isSelected: false)));
}
