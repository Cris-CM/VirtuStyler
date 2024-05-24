import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

import '../../../core/widgets/custom_input.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.mostWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ).marginOnly(bottom: 20),
                const Texts.regular(
                  'VIRTU\n Styler',
                  color: Palette.black,
                  fontSize: 50,
                  fontFamily: "Alegreya",
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, top: 20, right: 50),
              height: 70.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.whiteGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texts.bold(
                    'Registrarse',
                    fontSize: 40,
                    color: Palette.black,
                  ).marginOnly(bottom: 20),
                  const Texts.regular(
                    'nombres',
                    color: Palette.whiteOpacity,
                  ),
                  const CustomInput(
                    hinttext: 'Escribe tu nombre',
                  ).marginOnly(bottom: 25),
                  const Texts.regular(
                    'Correo Electronico',
                    color: Palette.whiteOpacity,
                  ),
                  const CustomInput(
                    hinttext: 'Escribe tu correo',
                  ).marginOnly(bottom: 25),
                  const Texts.regular(
                    'Password',
                    color: Palette.whiteOpacity,
                  ),
                  const CustomInput(
                    hinttext: 'Escribe una contraseña de 8 digitos',
                    limitToEightCharacters: true,
                  ).marginOnly(bottom: 50),
                  Center(
                    child: Column(
                      children: [
                        CustomButton(
                          buttonText: 'Registrarse',
                          onPressed: () {
                            Get.toNamed("/selecGender");
                          },
                          textColor: Palette.white,
                        ).marginOnly(bottom: 50),
                        CustomButton(
                          buttonText: 'Iniciar Session',
                          textColor: Palette.white,
                          onPressed: () {
                            Get.toNamed("/signIn");
                          },
                        ),
                      ],
                    ),
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
