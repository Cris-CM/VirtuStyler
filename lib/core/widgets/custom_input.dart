import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_shadows.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.hinttext,
    this.controller,
    this.limitToEightCharacters = false,
    this.width = double.infinity,
    this.showSearchIcon = false,
    this.obscureText = false,
  });

  final String hinttext;
  final TextEditingController? controller;
  final bool limitToEightCharacters;
  final double? width;
  final bool showSearchIcon;
  final bool obscureText;
  @override
  // ignore: library_private_types_in_public_api
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: widget.width ?? double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
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
      child: Row(
        children: [
          if (widget.showSearchIcon)
            const Icon(
              Icons.search,
              color: Palette.whiteOpacity,
              size: 35,
            ).marginOnly(right: 15),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              maxLength: widget.limitToEightCharacters ? 8 : null,
              decoration: InputDecoration(
                hintText: widget.hinttext,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 2.w),
                hintStyle: const TextStyle(
                  color: Palette.whiteOpacity,
                  fontSize: 14,
                ),
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
