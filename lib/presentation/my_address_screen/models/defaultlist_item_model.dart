
/// This class is used in the [defaultlist_item_widget] screen.

class DefaultListItemModel {
  String home;

  String parkerRd;

  String widget;

  int? id;

  DefaultListItemModel({
    required this.home,
    required this.parkerRd,
    required this.widget,
    this.id,
  });
}

List<DefaultListItemModel> defaultListItemList = ([
  DefaultListItemModel(
      home: "Home",
      parkerRd: "4140 parker rd. allentown, new \nmexico 31134",
      widget: "(405) 555-0128"),
  DefaultListItemModel(
      home: "Office",
      parkerRd: "4140 parker rd. allentown, new \nmexico 31134",
      widget: "(405) 555-0128"),
  DefaultListItemModel(
      home: "Office 2",
      parkerRd: "4140 parker rd. allentown, new \nmexico 31134",
      widget: "(405) 555-0128")
]);
