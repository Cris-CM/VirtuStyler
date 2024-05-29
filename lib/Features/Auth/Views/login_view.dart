import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/custom_shadows.dart';
import 'package:virtustyler/core/widgets/texts.dart';

import '../../../core/widgets/custom_input.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Builder(builder: (context) {
          if (controller.loading()) {
            return const CircularProgressIndicator();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ).marginOnly(bottom: 2.h, top: 4.h),
                    const Texts.regular(
                      'VIRTU\n Styler',
                      color: Palette.black,
                      fontSize: 20,
                      fontFamily: "Alegreya",
                    ).marginOnly(bottom: 7.h),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  width: double.infinity,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: Palette.whiteGrey,
                    boxShadow: [
                      CustomShadows.dropShadow(
                        x: 0,
                        y: -2,
                        blurRadius: 4,
                        opacity: .25,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34.sp),
                      topRight: Radius.circular(34.sp),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Texts.bold(
                        'Iniciar Sesión',
                        fontSize: 18,
                        color: Palette.brown,
                      ).marginOnly(bottom: 3.h),
                      const Texts.regular(
                        'Correo Electronico',
                        color: Palette.darkGreen,
                        fontSize: 10,
                      ).marginOnly(bottom: 2.h, left: 1.w),
                      CustomInput(
                        hinttext: 'Escribe tu correo',
                        controller: controller.emailLoginController,
                      ).marginOnly(bottom: 3.h),
                      const Texts.regular(
                        'Password',
                        color: Palette.darkGreen,
                        fontSize: 10,
                      ).marginOnly(bottom: 2.h, left: 1.w),
                      CustomInput(
                        hinttext: 'Ingrese una contraseña',
                        controller: controller.passwordLoginController,
                        obscureText: true,
                      ).marginOnly(bottom: 50),
                      CustomButton(
                        buttonText: 'Ingresar'.toUpperCase(),
                        onPressed: controller.login,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Texts.regular(
                          "Crea una cuenta nueva",
                          fontSize: 11,
                          color: Palette.black.withOpacity(.5),
                        ).marginSymmetric(vertical: 3.h),
                      ),
                      CustomButton(
                        buttonText: 'Registrarse'.toUpperCase(),
                        onPressed: () {
                          Get.toNamed("/register");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
