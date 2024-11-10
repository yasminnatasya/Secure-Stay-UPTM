
/// This class is used in the [frame1_item_widget] screen.



class Frame1ItemModel {
  String tag;
  bool isSelectCreative;

  Frame1ItemModel({
    required this.tag,
    required this.isSelectCreative,
  });

}

List<Frame1ItemModel> listFrame1ItemModelDetail = [
  Frame1ItemModel(tag: "Photography 📷", isSelectCreative: false),
  Frame1ItemModel(tag: "Yoga 🧘", isSelectCreative: false),
  Frame1ItemModel(tag: "Gym 🏋️‍♂️", isSelectCreative: false),
  Frame1ItemModel(tag: "Art 🖼️", isSelectCreative: false),
  Frame1ItemModel(tag: "Painting 🎨‍", isSelectCreative: false),
  Frame1ItemModel(tag: "Walk 🏃", isSelectCreative: false),
  Frame1ItemModel(tag: "Travel ✈️", isSelectCreative: false),
  Frame1ItemModel(tag: "Food 🍕", isSelectCreative: false),
  Frame1ItemModel(tag: "Technology 📱", isSelectCreative: false),
  Frame1ItemModel(tag: "Fashion 👗", isSelectCreative: false),

];
