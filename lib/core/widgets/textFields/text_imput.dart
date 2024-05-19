// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';

class TextImput extends StatefulWidget {
  const TextImput({
    super.key,
    required this.hinttext,
    required this.obscureText,
    this.controller,
    this.limitToEightCharacters = false,
    this.showEyeIcon = true,
  });

  final String hinttext;
  final bool obscureText;
  final TextEditingController? controller;
  final bool limitToEightCharacters;
  final bool showEyeIcon;

  @override
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
      padding: const EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
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
            suffixIcon: widget.showEyeIcon
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Palette.whiteOpacity,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            counterText: '',
          ),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
