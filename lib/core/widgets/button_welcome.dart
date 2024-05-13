import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class ButtonWelcome extends StatelessWidget {
  const ButtonWelcome({
    super.key,
    required this.buttonText,
    this.buttonColor = Palette.black34,
    required this.textColor,
  });

  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        minimumSize: const MaterialStatePropertyAll(Size(200, 100)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {},
      child: CustomText(
        text: buttonText,
        color: textColor,
        fontSize: 33,
      ),
    );
  }
}
