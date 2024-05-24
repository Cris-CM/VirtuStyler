import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';

class CustomShadows {
  static BoxShadow dropShadow({
    required double x,
    required double y,
    required double blurRadius,
    required double opacity,
    double spreadRadius = 0,
  }) {
    return BoxShadow(
      offset: Offset(x, y),
      spreadRadius: spreadRadius,
      color: Palette.black.withOpacity(opacity),
      blurRadius: blurRadius,
    );
  }
}
