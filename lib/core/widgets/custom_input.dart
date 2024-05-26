import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_shadows.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.hinttext,
    this.controller, 
    this.obscureText = false,
  });

  final String hinttext;
  final TextEditingController? controller;
 
  final bool obscureText;

  @override
  State<StatefulWidget> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          CustomShadows.dropShadow(
            x: 0,
            y: 4,
            blurRadius: 14,
            opacity: .12,
          ),
        ],
        borderRadius: BorderRadius.circular(22.sp),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
         
          hintText: widget.hinttext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.only(
            left: 5.w,
            top: 2.h,
            bottom: 2.h,
          ),
          hintStyle: const TextStyle(
            color: Palette.whiteOpacity,
            fontSize: 16,
           ),
        ),
      ),
    );
  }
}
