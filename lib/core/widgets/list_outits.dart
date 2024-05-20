import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../colors/palette.dart';
import 'custom_texts.dart';

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
                CustomText(
                  text: 'Nike Sportswear Club ',
                  fontSize: 25,
                ),
                CustomText(
                  text: 'Fleece',
                  fontSize: 20,
                ),
                CustomText(
                  text: '\$/. 100',
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
