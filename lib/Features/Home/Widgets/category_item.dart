import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Palette.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/camisa.png',
            fit: BoxFit.cover,
          ).marginOnly(right: 3.w),
          const Texts.regular(
            'Camisa',
            fontSize: 12,
            color: Palette.blueBlack,
          ),
        ],
      ),
    );
  }
}
