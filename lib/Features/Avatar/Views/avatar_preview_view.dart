import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Avatar/Controllers/avatar_controller.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';

class AvatarPreviewView extends GetView<AvatarController> {
  const AvatarPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: Column(
        children: [
          Expanded(
            child: O3D.network(
              src:
                  "https://api.readyplayer.me/v2/avatars/${controller.avatarTemplateModel.id}.glb",
            ),
          ),
          CustomButton(
            buttonText: "Confirmar",
            onPressed: () {
              Get.toNamed("/home");
            },
          ).marginSymmetric(vertical: 5.h, horizontal: 10.w),
        ],
      ),
    );
  }
}
