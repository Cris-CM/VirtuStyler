import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';

import '../../core/widgets/custom_texts.dart';

class SelecSize extends StatelessWidget {
  const SelecSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteGrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 10.h,
              decoration: const BoxDecoration(
                color: Palette.whiteGrey,
              ),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Container(
              width: double.infinity,
              height: 10.h,
              decoration: const BoxDecoration(
                color: Palette.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Seleccione su genero',
                    fontSize: 30,
                    alignment: CustomTextAlignment.center,
                  ),
                  Container(
                    width: 40.h,
                    height: 3,
                    color: Palette.black,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.whiteGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWelcome(
                    buttonText: 'S',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(200, 80),
                    onPressed: () {
                      Get.toNamed("/signIn");
                    },
                    textColor: Palette.white,
                  ).marginOnly(bottom: 40),
                  ButtonWelcome(
                    buttonText: 'M',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(200, 80),
                    onPressed: () {
                      Get.toNamed("/signIn");
                    },
                    textColor: Palette.white,
                  ).marginOnly(bottom: 40),
                  ButtonWelcome(
                    buttonText: 'L',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(200, 80),
                    onPressed: () {
                      Get.toNamed("/signIn");
                    },
                    textColor: Palette.white,
                  ).marginOnly(bottom: 40),
                  ButtonWelcome(
                    buttonText: 'XL',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(200, 80),
                    onPressed: () {
                      Get.toNamed("/signIn");
                    },
                    textColor: Palette.white,
                  ).marginOnly(bottom: 110),
                  ButtonWelcome(
                    buttonText: 'Confirmar',
                    textColor: Palette.white,
                    onPressed: () {
                      Get.toNamed("/signIn");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
