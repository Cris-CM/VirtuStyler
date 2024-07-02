import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.active = true,
    this.color,
  });

  final String buttonText;
  final Function() onPressed;
  final Color? color;
  final bool active;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  var pressed = false;
  final duration = 2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color ?? Palette.brown,
        minimumSize: Size(double.infinity, 7.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      onPressed: pressed
          ? () {}
          : widget.active
              ? () {
                  setState(() {
                    pressed = true;
                  });
                  Future.delayed(Duration(seconds: duration)).whenComplete(
                    () => widget.onPressed(),
                  );
                  Future.delayed(Duration(seconds: duration)).whenComplete(
                    () => setState(() {
                      pressed = false;
                    }),
                  );
                }
              : null,
      child: pressed
          ? const CircularProgressIndicator(
              color: Palette.white,
            )
          : Texts.regular(
              widget.buttonText.toUpperCase(),
              color: Palette.white,
              fontSize: 10,
            ),
    );
  }
}
