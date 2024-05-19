import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

import '../../core/widgets/textFields/text_imput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuarioController = TextEditingController();

  TextEditingController contraController = TextEditingController();

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
                  text: 'VIRTU\nStyler',
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
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Registrarse',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Palette.black,
                  ).marginOnly(bottom: 20),
                  const CustomText(
                    text: 'nombres',
                    color: Palette.whiteOpacity,
                  ),
                  const TextImput(
                    hinttext: 'Escribe tu nombre',
                    obscureText: false,
                    showEyeIcon: false,
                  ).marginOnly(bottom: 25),
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
                    hinttext: 'Escribe una contraseña de 8 digitos',
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
