import '../../../core/app_export.dart';

/// This class is used in the [icadd_item_widget] screen.

class IcaddItemModel {
  IcaddItemModel({
    this.icAdd,
    this.id,
  }) {
    icAdd = icAdd ?? Rx(ImageConstant.add);
    id = id ?? Rx("");
  }

  Rx<String>? icAdd;

  Rx<String>? id;
}
