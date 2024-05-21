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
  TextEditingController usuarioController = TextEditingController();

  TextEditingController contraController = TextEditingController();

  final String defaulUsername = 'admin';
  final String defaulContra = 'admin';

  void validateAndSubmit() {
    final usuario = usuarioController.text.trim();
    final contra = contraController.text.trim();

    if (usuario.isEmpty || contra.isEmpty) {
      Get.snackbar(
        'Error',
        'Por favor, complete todos los campos.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        instantInit: true,
        colorText: Colors.white,
      );
      return;
    }

    if (usuario == defaulUsername && contra == defaulContra) {
      Get.toNamed("home");
    } else {
      Get.snackbar(
        'Error',
        'Por favor, complete todos los campos.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        instantInit: true,
        colorText: Colors.white,
      );
    }
  }

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
                  TextImput(
                    hinttext: 'Escribe tu correo',
                    controller: usuarioController,
                    obscureText: false,
                    showEyeIcon: false,
                  ).marginOnly(bottom: 25),
                  const CustomText(
                    text: 'Password',
                    color: Palette.whiteOpacity,
                  ),
                  TextImput(
                    hinttext: 'Ingrese una contraseña',
                    controller: contraController,
                    obscureText: true,
                    showEyeIcon: true,
                    limitToEightCharacters: true,
                  ).marginOnly(bottom: 50),
                  Center(
                    child: Column(
                      children: [
                        ButtonWelcome(
                          buttonText: 'Ingresar',
                          onPressed: validateAndSubmit,
                          textColor: Palette.white,
                        ).marginOnly(bottom: 50),
                        ButtonWelcome(
                          buttonText: 'Iniciar Session',
                          textColor: Palette.white,
                          onPressed: validateAndSubmit,
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
