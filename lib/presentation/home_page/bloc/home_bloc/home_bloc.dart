import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rafah_fam_test/core/utils/size_utils.dart';
import '../../../../core/app_export.dart';
import '../../../../core/utils/image_constant.dart';
import '../../models/home_model.dart';

import '../../models/city_item_model.dart';
import '../../../property_list/model/property_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ScrollController scrollController;

  HomeBloc(
    HomeState initialState,
    this.scrollController,
  ) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<ScrollToNextEvent>(_mapScrollToNextEventToState);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      homeModelObj: state.homeModelObj?.copyWith(
        cityItemModel: fillcityItemList(),
      ),
    ));
  }

  List<CityItemModel> fillcityItemList() {
    return [
      CityItemModel(name: "Emaar", imagePath: ImageConstant.emmarimage),
      CityItemModel(name: "Downtown", imagePath: ImageConstant.downtownimage),
      CityItemModel(name: "Nakheel", imagePath: ImageConstant.nakheelimage),
      CityItemModel(name: "Marina", imagePath: ImageConstant.marinaimage),
      CityItemModel(name: "JVC", imagePath: ImageConstant.jvcimage),
      CityItemModel(
          name: "Dubai Holding", imagePath: ImageConstant.dubaiholding),
    ];
  }

  void _mapScrollToNextEventToState(
    ScrollToNextEvent event,
    Emitter<HomeState> emit,
  ) {
    final double currentOffset = scrollController.offset;

    final double screenWidth = 500.h;

    final double nextOffset = currentOffset + screenWidth;

    scrollController.animateTo(
      nextOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
