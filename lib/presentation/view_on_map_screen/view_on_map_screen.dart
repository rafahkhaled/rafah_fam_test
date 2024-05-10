import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'bloc/view_on_map_bloc.dart';
import 'bloc/view_on_map_state.dart';
import 'widget/filteration_on_map_widget.dart';

// ignore: must_be_immutable
class ViewOnMapScreen extends StatelessWidget {
  ViewOnMapScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<ViewOnMapBloc>(
      create: (context) =>
          ViewOnMapBloc(ViewOnMapState([]), [])..add(ViewOnMapInitialEvent()),
      child: ViewOnMapScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ViewOnMapBloc viewOnMapBloc = BlocProvider.of<ViewOnMapBloc>(context);

    return BlocBuilder<ViewOnMapBloc, ViewOnMapState>(
      bloc: viewOnMapBloc,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: CustomIconButton(
              height: 60,
              width: 60,
              onTap: () {
                NavigatorService.goBack();
              },
              decoration: AppDecoration.fillWhiteA.copyWith(boxShadow: [
                BoxShadow(
                  color: appTheme.gray10001
                      .withOpacity(0.2), // Set shadow color with opacity
                  spreadRadius: 4, // Spread radius
                  blurRadius: 8, // Blur radius
                  offset: Offset(0, 4), // Offset
                ),
              ], shape: BoxShape.circle),
              child: Icon(
                Icons.list_rounded,
                color: appTheme.bluecolor,
                size: 30,
              )),
          body: _buildViewonMapOne(context, viewOnMapBloc.markerList),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildViewonMapOne(BuildContext context, List<Marker> markers) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            markers: markers.toSet(),
            initialCameraPosition: CameraPosition(
              target: LatLng(25.1854, 55.2801),
              zoom: 17.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 24.h, right: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterationWidget(),
                CustomIconButton(
                  height: 40,
                  width: 40,
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      border: Border.all(
                        color: appTheme.black900,
                      ),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.search,
                    color: appTheme.bluecolor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
