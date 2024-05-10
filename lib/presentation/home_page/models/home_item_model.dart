import '../../../core/app_export.dart';

/// This class is used in the [home_item_widget] screen.
// ignore_for_file: must_be_immutable

class HomeItemModel {
  HomeItemModel(
      {this.wingsTowerOne,
      this.favoriteOne,
      this.price,
      this.month,
      this.wingsTowerTwo,
      this.text,
      this.jakartaindonesi,
      this.id}) {
    wingsTowerOne = wingsTowerOne ?? ImageConstant.imgShape13;
    favoriteOne = favoriteOne ?? ImageConstant.imgFavoriteWhiteA700;
    price = price ?? "\$ 220";
    month = month ?? "/month";
    wingsTowerTwo = wingsTowerTwo ?? "Wings Tower";
    text = text ?? "4.9";
    jakartaindonesi = jakartaindonesi ?? "Jakarta, Indonesia";
    id = id ?? "";
  }

  String? wingsTowerOne;

  String? favoriteOne;

  String? price;

  String? month;

  String? wingsTowerTwo;

  String? text;

  String? jakartaindonesi;

  String? id;
}
