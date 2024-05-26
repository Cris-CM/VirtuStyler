import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/home/product");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/model.png',
                fit: BoxFit.cover,
              ),
            ),
            const Texts.regular(
              'Nike Sportswear Club ',
              fontSize: 10,
            ).marginOnly(left: 2.w, bottom: 1.h, top: 1.h),
            const Texts.regular(
              'Fleece',
              fontSize: 10,
            ).marginOnly(left: 2.w, bottom: 1.h),
            const Texts.bold(
              '\S/. 100',
              fontSize: 12,
            ).marginOnly(left: 2.w, bottom: 2.h, top: 1.h),
          ],
        ),
      ),
    );
  }
}
