import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final CustomTextAlignment alignment;

  const CustomText({
    super.key,
    required this.text,
    this.color = Palette.black,
    this.fontSize = 22,
    this.fontWeight = FontWeight.normal,
    this.alignment = CustomTextAlignment.left,
  });

  @override
  Widget build(BuildContext context) {
    TextAlign textAlign;
    switch (alignment) {
      case CustomTextAlignment.center:
        textAlign = TextAlign.center;
        break;
      case CustomTextAlignment.right:
        textAlign = TextAlign.right;
        break;
      default:
        textAlign = TextAlign.left;
        break;
    }
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}

enum CustomTextAlignment {
  left,
  center,
  right,
}
