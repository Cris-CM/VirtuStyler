import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class SelectGender extends GetView<AuthController> {
  const SelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                ).marginSymmetric(vertical: 1.h),
                Container(
                  width: double.infinity,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    color: Palette.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Texts.regular(
                        'Seleccione su genero',
                        fontSize: 12,
                      ),
                      Container(
                        width: 40.h,
                        height: 3,
                        color: Palette.black,
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    color: Palette.darkGreen,
                    buttonText: 'Hombre',
                    onPressed: () {},
                  ),
                  CustomButton(
                    color: Palette.darkGreen,
                    buttonText: 'Mujer',
                    onPressed: () {},
                  ),
                  CustomButton(
                    color: Palette.darkGreen,
                    buttonText: 'Ambos',
                    onPressed: () {},
                  ),
                ],
              ).paddingSymmetric(horizontal: 30.w),
            ),
            CustomButton(
              buttonText: 'continuar'.toUpperCase(),
              onPressed: () {
                Get.toNamed("/register/selecSize");
              },
            ).marginOnly(bottom: 4.h, left: 8.w, right: 8.w)
          ],
        ),
      ),
    );
  }
}
