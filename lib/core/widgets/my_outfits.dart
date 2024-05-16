import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class MyOutfits extends StatelessWidget {
  const MyOutfits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23.5.h,
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Palette.white,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/outfit.png',
            fit: BoxFit.contain,
          ).marginOnly(bottom: 35),
          const CustomText(
            text: 'Casual',
            fontSize: 26,
            color: Palette.blueBlack,
          ),
        ],
      ),
    );
  }
}
