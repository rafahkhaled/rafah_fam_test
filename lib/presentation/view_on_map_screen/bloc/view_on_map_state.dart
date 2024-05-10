import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMapState extends Equatable {
  final List<Marker> markerList;

  ViewOnMapState(this.markerList);

  @override
  List<Object?> get props => [markerList];
}

class MarkerAddedState extends ViewOnMapState {
  MarkerAddedState(List<Marker> markerList) : super(markerList);
}
