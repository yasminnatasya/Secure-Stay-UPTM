import '../../../core/app_export.dart';

/// This class is used in the [chatslist_item_widget] screen.

class ChatsListItemModel {
  String robertfox;

  String robertFox;

  String awesome;

  String time;

  int? id;

  ChatsListItemModel({
    required this.robertfox,
    required this.robertFox,
    required this.awesome,
    required this.time,
    this.id,
  });
}

List<ChatsListItemModel> chatsListItemList = ([
  ChatsListItemModel(
      robertfox: ImageConstant.imgEllipse22,
      robertFox: "Ahmad",
      awesome: "Hello",
      time: "08:00"),
]);
