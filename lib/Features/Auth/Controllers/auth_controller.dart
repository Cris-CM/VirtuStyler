import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/colors/palette.dart';

class AuthController extends GetxController {
  TextEditingController usuarioController = TextEditingController();

  TextEditingController contraController = TextEditingController();
  final String defaulUsername = 'admin';

  final String defaulContra = 'admin';

  void login() {
    final usuario = usuarioController.text.trim();
    final contra = contraController.text.trim();

    if (usuario.isEmpty || contra.isEmpty) {
      Get.snackbar(
        'Error',
        'Por favor, complete todos los campos.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Palette.red,
        instantInit: true,
        colorText: Palette.white,
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
}
