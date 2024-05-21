import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';

class TextImput extends StatefulWidget {
  const TextImput({
    super.key,
    required this.hinttext,
    this.obscureText = false,
    this.controller,
    this.limitToEightCharacters = false,
    this.showEyeIcon = false,
    this.showSearchIcon = false,
    this.width = double.infinity,
  });

  final String hinttext;
  final bool obscureText;
  final TextEditingController? controller;
  final bool limitToEightCharacters;
  final bool showEyeIcon;
  final bool showSearchIcon;
  final double? width;

  @override
  // ignore: library_private_types_in_public_api
  _TextImputState createState() => _TextImputState();
}

class _TextImputState extends State<TextImput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: widget.width ?? double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(40),
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
              obscureText: _obscureText,
              maxLength: widget.limitToEightCharacters ? 8 : null,
              decoration: InputDecoration(
                hintText: widget.hinttext,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Palette.whiteOpacity,
                  fontSize: 22,
                ),
                suffixIcon: widget.showEyeIcon && !widget.showSearchIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Palette.whiteOpacity,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
