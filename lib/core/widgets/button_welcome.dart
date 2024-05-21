import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class ButtonWelcome extends StatelessWidget {
  const ButtonWelcome({
    super.key,
    required this.buttonText,
    this.buttonColor = Palette.brown,
    required this.textColor,
    required this.onPressed,
    this.minimumSize = const Size(390, 70),
  });

  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        minimumSize: MaterialStatePropertyAll(minimumSize),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: buttonText,
        color: textColor,
        fontSize: 33,
      ),
    );
  }
}
