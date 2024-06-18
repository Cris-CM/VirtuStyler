import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Avatar/Controllers/avatar_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class AvatarView extends GetView<AvatarController> {
  const AvatarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Column(
          children: [
            const Texts.bold(
              "Crea tu avatar",
            ).marginOnly(top: 10.h),
            Expanded(
              child: Obx(() {
                return GestureDetector(
                  onTap: controller.getPhotoPerson,
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Palette.blueBlack,
                      ),
                      borderRadius: BorderRadius.circular(10.sp),
                      image: controller.imagePerson() == null
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                File(controller.imagePerson()!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: controller.imagePerson() == null
                        ? Icon(
                            Icons.photo,
                            size: 30.sp,
                          )
                        : null,
                  ),
                );
              }),
            ),
            Obx(() {
              return CustomButton(
                buttonText: "Generar Avatar",
                onPressed: controller.getAvatarToPhoto,
                active: controller.imagePerson() != null,
              ).marginOnly(bottom: 5.h, right: 10.w, left: 10.w);
            }),
          ],
        ),
      ),
    );
  }
}
