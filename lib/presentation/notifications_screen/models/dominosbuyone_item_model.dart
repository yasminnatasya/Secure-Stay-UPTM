
/// This class is used in the [dominosbuyone_item_widget] screen.

class DominosbuyoneItemModel {
  String dominoSBuyOne;

  String buyGetFree;

  String duration;

  String? id;

  DominosbuyoneItemModel({
    required this.dominoSBuyOne,
    required this.buyGetFree,
    required this.duration,
    this.id,
  });
}

    List<DominosbuyoneItemModel> dominosbuyoneItemList =([
  DominosbuyoneItemModel(
      dominoSBuyOne: "Free home inspection",
      buyGetFree:
      "Offer to pay for the buyer's home inspection, or to reimburse them for",
      duration: "30 seconds ago"),
  DominosbuyoneItemModel(
      dominoSBuyOne: "Waived contingencies",
      buyGetFree:
      "Offer to waive some or all of the contingencies in your offer, ",
      duration: "30 min ago"),
  DominosbuyoneItemModel(
      dominoSBuyOne: "Quick closing",
      buyGetFree:
      "Offer to close on the property quickly, within a few weeks or even sooner.",
      duration: "2 hour ago"),
  DominosbuyoneItemModel(
      dominoSBuyOne: "Flexible financing options",
      buyGetFree:
      "Offer to work with the buyer to find financing that meets their needs.",
      duration: "12 hour ago"),
  DominosbuyoneItemModel(
      dominoSBuyOne: "Closing cost assistance",
      buyGetFree:
      "Offer to pay for a portion of the buyer's closing costs, such as title insurance.",
      duration: "a few seconds ago")
 ]);

