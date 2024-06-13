import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color iconColor;
  final double fontSize;
  final IconData iconData;
  final Function()? onTap;

  const IconAndText({
    super.key,
    required this.text,
    this.textColor = Palette.black,
    this.iconColor = Palette.black,
    this.fontSize = 9,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 4.w),
      onTap: onTap,
      title: Texts.regular(
        text,
        color: textColor,
        fontSize: fontSize,
      ),
      leading: Icon(
        iconData,
        size: 17.sp,
        color: iconColor,
      ),
    );
  }
}
