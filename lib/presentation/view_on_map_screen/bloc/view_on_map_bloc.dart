import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/app_export.dart';
import '../widget/widget_to_map_icon.dart';
import 'view_on_map_state.dart';
part 'view_on_map_event.dart';

/// A bloc that manages the state of a ViewOnMap according to the event that is dispatched to it.
class ViewOnMapBloc extends Bloc<ViewOnMapEvent, ViewOnMapState> {
  List<Marker> markerList = <Marker>[];

  ViewOnMapBloc(ViewOnMapState initialState, this.markerList)
      : super(initialState) {
    on<ViewOnMapInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    ViewOnMapInitialEvent event,
    Emitter<ViewOnMapState> emit,
  ) async {
    await _mapAddMarkerEventToState(event, emit);
  }

  Future<void> _mapAddMarkerEventToState(
    ViewOnMapInitialEvent event,
    Emitter<ViewOnMapState> emit,
  ) async {
    final MarkerId markerId = const MarkerId("MarkerId");
    if (!markerList.any((marker) => marker.markerId == markerId)) {
      markerList.add(Marker(
          markerId: markerId,
          position: LatLng(25.1854, 55.2801),
          icon: await getCustomMarkerIcon().toBitmapDescriptor(
              logicalSize: const Size(500, 500),
              imageSize: const Size(500, 500))));

      emit(MarkerAddedState(List<Marker>.from(markerList)));
    }
  }
}
