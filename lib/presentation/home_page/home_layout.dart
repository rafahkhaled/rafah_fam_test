import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafah_fam_test/core/utils/size_utils.dart';
import 'package:rafah_fam_test/localization/app_localization.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_icon_button.dart';
import '../property_list/property_list.dart';
import 'widgets/area_list_widget.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        shadowColor: appTheme.gray10001.withOpacity(0.2),
        bottomOpacity: 0,
        leading: Icon(Icons.arrow_back_ios),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            boxShadow: [
              BoxShadow(
                color: appTheme.gray10001.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        backgroundColor: appTheme.whiteA700,
        iconTheme: IconThemeData(color: appTheme.black900),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: CustomIconButton(
              height: 40,
              width: 40,
              decoration: AppDecoration.fillWhiteA.copyWith(
                border: Border.all(
                  color: appTheme.gray10001,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: appTheme.bluecolor,
              ),
            ),
          )
        ],
        title: Text(
          "msg_new_developments".tr,
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 10),
        width: 140.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              height: 70,
              padding: EdgeInsets.all(20.h),
              width: 70,
              decoration: AppDecoration.fillWhiteA.copyWith(
                boxShadow: [
                  BoxShadow(
                    color: appTheme.gray10001.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ImageConstant.descending,
                // ignore: deprecated_member_use
                color: appTheme.bluecolor,
              ),
            ),
            CustomIconButton(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(20.h),
              onTap: () {
                NavigatorService.pushNamed(AppRoutes.viewOnMapScreen);
              },
              decoration: AppDecoration.fillWhiteA.copyWith(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: appTheme.gray10001.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                ImageConstant.pin,
                // ignore: deprecated_member_use
                color: appTheme.bluecolor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(
                left: 24.h,
              ),
              child: ArealistWidget(),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 24.h, right: 24.h),
              child: AllpropertyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
