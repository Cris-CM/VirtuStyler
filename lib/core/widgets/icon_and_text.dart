import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize; 
  final IconData iconData;

  const IconAndText({
    super.key,
    required this.text,
    this.color = Palette.black,
    this.fontSize = 10, 
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: fontSize.sp,
          color: color,
        ).marginOnly(right: 3.w),
        Texts.regular(
          text,
          color: color,
          fontSize: fontSize,
        )
      ],
    ).marginOnly(left: 4.w);
  }
}
