import 'package:equatable/equatable.dart';

import 'city_item_model.dart';

/// This class defines the variables used in the [home_page],
// ignore_for_file: must_be_immutable

class HomeModel extends Equatable {
  HomeModel({
    this.cityItemList = const [],
  });

  List<CityItemModel> cityItemList;

  HomeModel copyWith({
    List<CityItemModel>? cityItemModel,
  }) {
    return HomeModel(
      cityItemList: cityItemModel ?? this.cityItemList,
    );
  }

  @override
  List<Object?> get props => [
        cityItemList,
      ];
}
