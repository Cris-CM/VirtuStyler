import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Models/category_model.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });
  final CategoryModel categoryModel;
  final String image;
  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: isSelected ? Palette.blueBlack : Palette.white,
        ),
        child: Row(
          children: [
            Image.network(
              image,
              color: isSelected ? Palette.white : Palette.blueBlack,
            ).marginOnly(right: 3.w),
            Texts.regular(
              categoryModel.name,
              fontSize: 12,
              color: isSelected ? Palette.white : Palette.blueBlack,
            ),
          ],
        ),
      ),
    );
  }
}
