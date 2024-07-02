import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.sp,
            backgroundColor: Palette.brown,
            child: Image.network(
                "https://models.readyplayer.me/${controller.authController.userModel.avatarId}.png"),
          ).marginOnly(bottom: 5.h),
          Texts.bold(
            'Hola, ${controller.authController.userModel.name}',
            fontSize: 14,
          ).marginOnly(bottom: 1.h),
          const Texts.regular(
            'Bienvenido a VirtuStyler',
            fontSize: 14,
          ).marginOnly(bottom: 2.h),
          const Texts.regular(
            'Pais: Perú',
            fontSize: 14,
          ).marginOnly(bottom: 5.h),
          CustomButton(
            buttonText: 'Editar Perfil',
            onPressed: () {},
          ).marginOnly(bottom: 2.h, right: 15.w, left: 15.w),
          CustomButton(
            buttonText: 'Ver historial',
            onPressed: () {},
          ).marginOnly(bottom: 2.h, right: 15.w, left: 15.w),
        ],
      ).paddingSymmetric(vertical: 4.h, horizontal: 5.w),
    );
  }
}
