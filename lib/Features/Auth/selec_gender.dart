import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';

import '../../core/widgets/custom_texts.dart';

class SelecGender extends StatelessWidget {
  const SelecGender({super.key});

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
              padding: const EdgeInsets.only(left: 50, top: 100, right: 50),
              height: 70.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.whiteGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWelcome(
                    buttonText: 'Hombre',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(230, 100),
                    onPressed: () {},
                    textColor: Palette.white,
                  ).marginOnly(bottom: 70),
                  ButtonWelcome(
                    buttonText: 'Mujer',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(230, 100),
                    onPressed: () {},
                    textColor: Palette.white,
                  ).marginOnly(bottom: 70),
                  ButtonWelcome(
                    buttonText: 'Ambos',
                    buttonColor: Palette.darkGreen,
                    minimumSize: const Size(230, 100),
                    onPressed: () {},
                    textColor: Palette.white,
                  ).marginOnly(bottom: 120),
                  ButtonWelcome(
                    buttonText: 'continuar',
                    textColor: Palette.white,
                    onPressed: () {
                      Get.toNamed("/selecSize");
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
