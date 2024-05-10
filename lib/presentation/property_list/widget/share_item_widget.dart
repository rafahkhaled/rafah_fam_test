import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafah_fam_test/core/app_export.dart';

// ignore: must_be_immutable
class ShareItem extends StatelessWidget {
  final String prefixicon;
  final IconData? suffxicon;
  final String text;
  final Color? iconColor;
  final TextStyle textStyle;
  VoidCallback? onTap;

  ShareItem({
    Key? key,
    this.prefixicon = '',
    required this.text,
    this.onTap,
    this.iconColor,
    required this.textStyle,
    this.suffxicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: 100.h,
        height: 40.h,
        padding: EdgeInsets.all(8.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          border: Border.all(color: appTheme.gray10001),
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixicon != '',
              child: SvgPicture.asset(
                prefixicon,
                height: 25,
                width: 25,

                // ignore: deprecated_member_use
                color: iconColor,
              ),
            ),
            SizedBox(width: 10), // Adjust the width as needed
            Text(text, style: textStyle),
            Visibility(
                visible: suffxicon != null,
                child: Icon(
                  suffxicon,
                  color: iconColor,
                  size: 20,
                )),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
