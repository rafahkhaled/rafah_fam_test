import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafah_fam_test/core/utils/size_utils.dart';
import 'package:rafah_fam_test/localization/app_localization.dart';

import '../../presentation/property_list/widget/icon_text_row.dart';
import '../../presentation/property_list/widget/share_item_widget.dart';
import '../../presentation/property_list/widget/swiper_widget.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import 'image_constant.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPropertyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _proshimmerloading();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}

Widget _proshimmerloading() {
  return Container(
    decoration: AppDecoration.fillWhiteA.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder8,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,

          child: SizedBox(
            height: 250,
            child: Imagesliderwidget(
              images: [],
            ),
          ),
        ),
        SizedBox(height: 25.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,

          child: Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EMMAR',
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
        ),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Text(
            'By fäm',
            style: theme.textTheme.bodySmall,
          ),
        ),
        SizedBox(height: 6.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
            width: 50.h,
            height: 5,
            color: appTheme.bluecolor,
          ),
        ),
        SizedBox(height: 6.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: IconSpanTextRow(
            icon: ImageConstant.tag,
            firstText: 'From'.tr,
            secondText: '2000000',
            iconColor: appTheme.gray10001,
            firstTextStyle: theme.textTheme.labelLarge!,
            secondTextStyle: theme.textTheme.labelLarge!,
          ),
        ),
        SizedBox(height: 6.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,

          child: IconTextRow(
            icon: ImageConstant.mappin,
            text: 'Dubai',
            iconColor: appTheme.gray10001,
            textStyle: theme.textTheme.bodySmall!,
          ),
        ),
        SizedBox(height: 6.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,

          child: IconTextRow(
            icon: ImageConstant.donutchart,
            text: 'Ready by 02/02/2024',
            iconColor: appTheme.gray10001,
            textStyle: theme.textTheme.bodySmall!,
          ),
        ),
        SizedBox(height: 6.v),
        Shimmer.fromColors(
          // Wrap the content with Shimmer.fromColors
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShareItem(
                text: 'Map'.tr,
                prefixicon: ImageConstant.mappin,
                textStyle: theme.textTheme.bodySmall!,
                iconColor: appTheme.bluecolor,
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
        ),
      ],
    ),
  );
}
