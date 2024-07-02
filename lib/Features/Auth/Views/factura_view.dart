import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/models/product_model.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import '../../../core/colors/palette.dart';
import '../../../core/widgets/texts.dart';

class PagosView extends StatelessWidget {
  const PagosView({super.key});

  @override
  Widget build(BuildContext context) {
    final productoModel = Get.arguments as ProductModel;
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
                Texts.regular(
                  productoModel.name,
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
                Texts.regular(
                  '\$${productoModel.price}',
                  fontSize: 12,
                ),
              ],
            ).marginOnly(bottom: 9.h),
            Column(
              children: [
                Row(
                  children: [
                    const Texts.regular(
                      'Total producto',
                      fontSize: 8,
                    ),
                    const Spacer(),
                    Texts.regular(
                      '\$${productoModel.price}',
                      fontSize: 8,
                    ),
                  ],
                ).marginOnly(bottom: 2.h),
                const Row(
                  children: [
                    Texts.regular(
                      'Envio',
                      fontSize: 8,
                    ),
                    Spacer(),
                    Texts.regular(
                      '\$0.00',
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
                Texts.bold(
                  '\$${productoModel.price}',
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
