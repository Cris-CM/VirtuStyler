import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(4.w, 50.h, 4.w, 2.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Palette.blackOpacity,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                text: 'Luce bien, siéntete bien',
                color: Palette.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text:
                    'Crea tu estilo individual y único y luce increíble\ntodos los días',
                color: Palette.whiteOpacity,
                fontSize: 20,
                alignment: CustomTextAlignment.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: const ButtonWelcome(
                      buttonText: 'Hombre',
                      textColor: Palette.white,
                    ).marginOnly(right: 2.w),
                  ),
                  const Expanded(
                    child: ButtonWelcome(
                      buttonText: 'Mujer',
                      textColor: Palette.white,
                      buttonColor: Palette.purple,
                    ),
                  ),
                ],
              ).marginOnly(bottom: 30),
              TextButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                child: const CustomText(
                  text: 'Skip',
                  color: Palette.whiteOpacity,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
