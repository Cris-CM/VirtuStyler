import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import 'package:virtustyler/core/widgets/icon_and_text.dart';
import '../../../core/colors/palette.dart';
import '../../../core/widgets/texts.dart';

class PagosView extends StatelessWidget {
  const PagosView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo.png').marginOnly(
                  right: 5.w,
                ),
                const Texts.regular(
                  'Reporte de Facturacion',
                  fontSize: 18,
                ),
              ],
            ).marginOnly(bottom: 5.h),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Palette.blue,
                  size: 7.w,
                ).marginOnly(right: 6.w),
                const Texts.regular(
                  'Polera',
                  fontSize: 12,
                ),
              ],
            ).marginOnly(bottom: 10.h),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Palette.green,
                  size: 7.w,
                ).marginOnly(right: 6.w),
                const Texts.regular(
                  'Total producto',
                  fontSize: 12,
                ),
                const Spacer(),
                const Texts.regular(
                  '\$200.00',
                  fontSize: 12,
                ),
              ],
            ).marginOnly(bottom: 9.h),
            Column(
              children: [
                const Row(
                  children: [
                    Texts.regular(
                      'Total producto',
                      fontSize: 8,
                    ),
                    Spacer(),
                    Texts.regular(
                      '\$00.00',
                      fontSize: 8,
                    ),
                  ],
                ).marginOnly(bottom: 2.h),
                const Row(
                  children: [
                    Texts.regular(
                      'Igv',
                      fontSize: 8,
                    ),
                    Spacer(),
                    Texts.regular(
                      '8%',
                      fontSize: 8,
                    ),
                  ],
                ).marginOnly(bottom: 2.h),
              ],
            ).paddingOnly(left: 5.w).marginOnly(bottom: 7.h),
            Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: Palette.green,
                  size: 7.w,
                ),
                const Texts.bold(
                  'Total cobrado',
                  fontSize: 18,
                ),
                const Spacer(),
                const Texts.bold(
                  '\$200.00',
                  fontSize: 15,
                ),
              ],
            ).marginOnly(bottom: 7.h),
            CustomButton(
              buttonText: 'regresar',
              onPressed: () {
                Get.back();
              },
            )
          ],
        ).paddingOnly(top: 2.h, left: 5.w, right: 5.w),
      ),
    );
  }
}
