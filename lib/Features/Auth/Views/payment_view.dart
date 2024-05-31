import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import '../../../core/colors/palette.dart';
import '../../../core/widgets/texts.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Texts.bold(
                    'Pago',
                    fontSize: 20,
                  ).marginOnly(bottom: 0.5.h),
                  Container(
                    width: 25.h,
                    height: 1.w,
                    color: Palette.black,
                  )
                ],
              ),
            ).marginOnly(bottom: 1.h),
            Container(
              height: 30.h,
              width: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tarjeta.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Texts(
                        'Hemendra Mali',
                        fontWeight: FontWeight.normal,
                        color: Palette.white,
                      ).marginOnly(right: 16.h),
                      const Texts(
                        'Visa',
                        fontWeight: FontWeight.bold,
                        color: Palette.white,
                      ),
                    ],
                  ).marginOnly(bottom: 7.h),
                  const Texts(
                    'Visa Classic',
                    fontWeight: FontWeight.normal,
                    color: Palette.white,
                  ).marginOnly(bottom: 2.h),
                  const Texts(
                    '5 2 5 4   * * * *     * * * *    7 6 9 0',
                    fontWeight: FontWeight.normal,
                    color: Palette.white,
                  ).marginOnly(bottom: 3.h),
                  const Texts(
                    '\$3,763.87',
                    fontWeight: FontWeight.normal,
                    color: Palette.white,
                  ),
                ],
              ),
            ).marginOnly(bottom: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Texts.bold(
                  'Titular de la tarjeta',
                  fontSize: 15,
                ).marginOnly(bottom: 1.h),
                const CustomInput(
                  hinttext: 'nombre y apellido',
                ).marginOnly(bottom: 4.h),
                const Texts.bold(
                  'Número de tarjeta',
                  fontSize: 15,
                ).marginOnly(bottom: 1.h),
                const CustomInput(
                  hinttext: 'nombre y apellido',
                ).marginOnly(bottom: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Texts.bold(
                            'Fecha de vencimiento',
                            fontSize: 13,
                          ).marginOnly(bottom: 1.h),
                          const CustomInput(
                            hinttext: '24/24',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Texts.bold(
                            'CVV',
                            fontSize: 15,
                          ).marginOnly(bottom: 3.h),
                          const CustomInput(
                            hinttext: '7763',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingOnly(left: 4.w, right: 4.w),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(
              buttonText: 'Guardar tarjeta',
              onPressed: () {
                Get.toNamed('/home');
              },
            )
          ],
        ).paddingOnly(top: 2.h, left: 5.w, right: 5.w),
      ),
    );
  }
}
