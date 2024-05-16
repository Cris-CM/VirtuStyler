import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/colors/palette.dart';

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
      backgroundColor: Palette.black34,
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 40, vertical: 80),
        child: Column(
          children: [
            const Column(
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                ),
                Text(
                  'Por favor ingresa tus datos para continuar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                TextImput(
                  labeltext: 'Usuario',
                  hinttext: 'Usuario',
                  obscureText: false,
                  controller: usuarioController,
                ),
                TextImput(
                  labeltext: 'Contraseña',
                  hinttext: 'Contraseña',
                  obscureText: true,
                  controller: contraController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '¿Has olvidado tu contraseña?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Recordar contraseña',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.toggle_on_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Palette.whiteOpacity),
                minimumSize: const MaterialStatePropertyAll(Size(200, 100)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                String usuario = usuarioController.text.trim();
                String contrasena = contraController.text.trim();
                if (usuario == 'admin' && contrasena == 'admin') {
                  Get.toNamed("/home");
                }
              },
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  fontSize: 25,
                  color: Palette.black,
                ),
              ),
            ).marginOnly(bottom: 20),
            const Column(
              children: [
                Text(
                  'Por favor escribe tu correo electrónico para recibir un código de confirmación para establecer una nueva contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
