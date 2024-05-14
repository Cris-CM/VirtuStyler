import 'package:flutter/material.dart';

class TextImput extends StatelessWidget {
  const TextImput({
    super.key, // Corrige el parámetro de key
    this.labeltext = '',
    required this.hinttext,
    required this.obscureText,
    this.controller,
  }); // Usa super con key correctamente

  final String labeltext;
  final String hinttext;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: const TextStyle(
          color: Colors.white70,
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent, // Color del borde cuando está inactivo
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent, // Color del borde cuando está activo
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
    );
  }
}
