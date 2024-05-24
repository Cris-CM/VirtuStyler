import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';
 
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: 70.h,
            width: double.infinity,
            color: Palette.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Palette.white,
                  ),
                ).marginOnly(bottom: 20),
                const Texts.bold(
                 'Hola, Ericka',
                  fontSize: 30,
                  
                ).marginOnly(bottom: 5),
                const Texts.regular(
                  'Bienvenida a VirtuStyler',
                  fontSize: 25,
                ).marginOnly(bottom: 5),
                const Texts.regular(
                  'Pais: Perú',
                  fontSize: 25,
                ).marginOnly(bottom: 50),
                CustomButton(
                  buttonText: 'Editar Perfil',
                  textColor: Palette.white,
                  minimumSize: const Size(250, 90),
                  onPressed: () {},
                ).marginOnly(bottom: 40),
                CustomButton(
                  buttonText: 'Ver historial',
                  textColor: Palette.white,
                  minimumSize: const Size(250, 90),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
