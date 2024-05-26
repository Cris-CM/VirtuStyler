import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.color,
  });

  final String buttonText;
  final Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Palette.brown,
        minimumSize: Size(double.infinity, 7.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      onPressed: onPressed,
      child: Texts.regular(
        buttonText.toUpperCase(),
        color: Palette.white,
        fontSize: 10,
      ),
    );
  }
}
