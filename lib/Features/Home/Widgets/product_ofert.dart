import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductOfert extends StatelessWidget {
  const ProductOfert({super.key});

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
            Container(
              height: 27.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/model.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Palette.red,
                        Palette.red.withOpacity(0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Texts(
                    fontSize: 10,
                    '-20%',
                    fontWeight: FontWeight.bold,
                    color: Palette.white,
                  ),
                ),
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
            Row(
              children: [
                const Texts.bold(
                  'S/. 100',
                  fontSize: 12,
                ).marginOnly(left: 2.w, bottom: 2.h, top: 1.h, right: 14.w),
                const Text(
                  'S/.120',
                  style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Palette.white05,
                    decorationThickness: 2,
                    color: Palette.white05,
                  ),
                ).marginOnly(bottom: 2.h, top: 1.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
