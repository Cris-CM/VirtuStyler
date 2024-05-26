import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';

class ProductPhotoItem extends StatelessWidget {
  const ProductPhotoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      width: 20.w,
      decoration: BoxDecoration(
        color: Palette.black,
        borderRadius: BorderRadius.circular(10.sp),
        image: const DecorationImage(
          image: AssetImage("assets/images/model.png"),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
