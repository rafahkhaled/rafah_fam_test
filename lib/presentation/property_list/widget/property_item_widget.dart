import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafah_fam_test/presentation/property_list/model/property_model.dart';
import 'package:rafah_fam_test/presentation/property_list/widget/icon_text_row.dart';
import '../../../core/app_export.dart';
import 'share_item_widget.dart';
import 'swiper_widget.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable

class PropertyItemWidget extends StatelessWidget {
  PropertyItemWidget(this.property, {Key? key, this.onTapEstatescard})
      : super(
          key: key,
        );

  Property property;

  VoidCallback? onTapEstatescard;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat("dd-MM-yyyy HH:mm:ss")
        .parse(property.buildingCompletionDate ?? "16-10-2018 00:00:00");

    return GestureDetector(
      onTap: () {
        onTapEstatescard?.call();
      },
      child: Container(
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 250,
                child: Imagesliderwidget(
                  images: property.images ?? [],
                )),
            SizedBox(height: 25.v),
            Padding(
              padding: EdgeInsets.only(right: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    property.buildingName ?? '',
                    style: theme.textTheme.labelLarge,
                  ),
                  SvgPicture.asset(
                    ImageConstant.imgforword,
                    // ignore: deprecated_member_use
                    color: appTheme.bluecolor,
                  )
                ],
              ),
            ),

            //// i have anthor soultaion for this if the value null will hide the whole section but here  i put defualt value :)
            Text(
              'By ${property.developerName ?? 'fäm'}',
              style: theme.textTheme.bodySmall,
            ),

            SizedBox(height: 6.v),
            Container(
              margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
              width: 50.h,
              height: 5,
              color: appTheme.bluecolor,
            ),
            SizedBox(height: 6.v),
            IconSpanTextRow(
              icon: ImageConstant.tag,
              firstText: 'From'.tr,
              secondText: property.startingPrice.toString(),
              iconColor: appTheme.gray10001,
              firstTextStyle: theme.textTheme.labelLarge!,
              secondTextStyle: theme.textTheme.labelLarge!,
            ),
            SizedBox(height: 6.v),
            IconTextRow(
              icon: ImageConstant.mappin,
              text: property.areaName ?? 'Dubai',
              iconColor: appTheme.gray10001,
              textStyle: theme.textTheme.bodySmall!,
            ),
            SizedBox(height: 6.v),
            IconTextRow(
              icon: ImageConstant.donutchart,
              text: 'Ready by ${DateFormat("dd-MM-yyyy").format(dateTime)}',
              iconColor: appTheme.gray10001,
              textStyle: theme.textTheme.bodySmall!,
            ),
            SizedBox(height: 6.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShareItem(
                  text: 'Map'.tr,
                  prefixicon: ImageConstant.mappin,
                  textStyle: theme.textTheme.bodySmall!,
                  iconColor: appTheme.bluecolor,
                  onTap: () {
                    NavigatorService.pushNamed(AppRoutes.viewOnMapScreen);
                  },
                ),
                ShareItem(
                  text: 'Chat'.tr,
                  prefixicon: ImageConstant.whatsapp,
                  textStyle: theme.textTheme.bodySmall!,
                ),
                ShareItem(
                  text: 'Details'.tr,
                  suffxicon: Icons.arrow_forward_ios,
                  textStyle: theme.textTheme.bodySmall!,
                  iconColor: appTheme.bluecolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
