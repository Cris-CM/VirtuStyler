import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/widgets/texts.dart';

import '../colors/palette.dart';

class ListOutfits extends StatelessWidget {
  const ListOutfits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 27.h,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 27.h,
            child: Image.asset(
              'assets/images/model.png',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.regular(
                  'Nike Sportswear Club ',
                  fontSize: 25,
                ),
                Texts.regular(
                  'Fleece',
                  fontSize: 20,
                ),
                Texts.regular(
                  '\$/. 100',
                  fontSize: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
