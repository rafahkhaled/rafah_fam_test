import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafah_fam_test/core/app_export.dart';

class IconTextRow extends StatelessWidget {
  final String icon;
  final String text;
  final Color iconColor;
  final TextStyle textStyle;

  IconTextRow({
    Key? key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.black,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          height: 25,

          // ignore: deprecated_member_use
          color: iconColor,
        ),
        SizedBox(width: 10), // Adjust the width as needed
        Text(text, style: textStyle)
      ],
    );
  }
}

class IconSpanTextRow extends StatelessWidget {
  final String icon;
  final String firstText;
  final String secondText;

  final Color iconColor;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;

  IconSpanTextRow({
    Key? key,
    required this.icon,
    required this.firstText,
    required this.secondText,
    this.iconColor = Colors.black,
    required this.firstTextStyle,
    required this.secondTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          height: 25,
          // ignore: deprecated_member_use
          color: iconColor,
        ),
        SizedBox(width: 10), // Adjust the width as needed
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: firstText,
              style: firstTextStyle,
            ),
            TextSpan(
              text: ' AED ',
              style: theme.textTheme.bodyMedium,
            ),
            TextSpan(
              text: secondText,
              style: secondTextStyle,
            ),
          ],
        ))
      ],
    );
  }
}
