import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:get/get.dart';

enum CustomTextAlignment {
  left,
  center,
  right,
}

class TextAndIconButton extends StatelessWidget {
  final String text;
  final List<IconData> icons;
  final List<Color> iconColors;
  final VoidCallback? onPressed;
  final CustomTextAlignment alignment;
  final String? destinationRoute;

  const TextAndIconButton({
    super.key,
    required this.text,
    required this.icons,
    required this.iconColors,
    this.onPressed,
    this.alignment = CustomTextAlignment.left,
    this.destinationRoute,
  });

  @override
  Widget build(BuildContext context) {
    TextAlign textAlign;
    switch (alignment) {
      case CustomTextAlignment.center:
        textAlign = TextAlign.center;
        break;
      case CustomTextAlignment.right:
        textAlign = TextAlign.right;
        break;
      default:
        textAlign = TextAlign.left;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: textAlign,
            style: const TextStyle(
              color: Palette.blueBlack,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () {
                if (destinationRoute != null) {
                  Get.toNamed(destinationRoute!);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Palette.white05,
                    width: 3.5,
                  ),
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icons[index],
                    size: 35,
                    color: iconColors[index],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
