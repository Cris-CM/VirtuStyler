 import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/button_welcome.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/fondo.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: ButtonWelcome(
                          buttonText: 'Hombre',
                          textColor: Palette.white,
                        ),
                      ),
                      ButtonWelcome(
                        buttonText: 'Mujer',
                        textColor: Palette.white,
                        buttonColor: Palette.purple,
                      ),
                    ],
                  ).marginOnly(bottom: 30),
                  TextButton(
                    onPressed: () {
                     Get.toNamed('/login');
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
        ],
      ),
    );
  }
}
