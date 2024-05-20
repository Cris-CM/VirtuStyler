import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/colors/palette.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData iconData;

  const IconAndText({
    super.key,
    required this.text,
    this.color = Palette.black,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: fontSize,
          color: color,
        ).marginOnly(right: 10, left: 30),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        )
      ],
    );
  }
}
