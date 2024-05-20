import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

import '../../../core/widgets/textFields/text_imput.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                const CustomText(
                  text: 'VIRTU\n Styler',
                  color: Palette.black,
                  fontSize: 50,
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
                  topRight: Radius.circular(80),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Iniciar Sesión',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Palette.black,
                  ).marginOnly(bottom: 100),
                  const CustomText(
                    text: 'Correo Electronico',
                    color: Palette.whiteOpacity,
                  ),
                  const TextImput(
                    hinttext: 'Escribe tu correo',
                    obscureText: false,
                    showEyeIcon: false,
                  ).marginOnly(bottom: 25),
                  const CustomText(
                    text: 'Password',
                    color: Palette.whiteOpacity,
                  ),
                  const TextImput(
                    hinttext: 'Ingrese una contraseña',
                    obscureText: false,
                    limitToEightCharacters: true,
                  ).marginOnly(bottom: 50),
                  Center(
                    child: Column(
                      children: [
                        ButtonWelcome(
                          buttonText: 'Ingresar',
                          onPressed: () {
                            Get.toNamed("/home");
                          },
                          textColor: Palette.white,
                        ).marginOnly(bottom: 50),
                        ButtonWelcome(
                          buttonText: 'Iniciar Session',
                          textColor: Palette.white,
                          onPressed: () {},
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
