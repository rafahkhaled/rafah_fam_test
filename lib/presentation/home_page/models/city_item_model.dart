/// This class is used in the [promotion_item_widget] screen.

// ignore_for_file: must_be_immutable
class CityItemModel {
  CityItemModel({this.imagePath, this.name}) {
    name = name ?? "EMMAR";
    imagePath = imagePath ?? "";
  }

  String? name;
  String? imagePath;
}
