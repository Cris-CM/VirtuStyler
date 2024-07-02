import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/models/category_model.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.sp),
          color: isSelected ? Palette.greyContainer : Palette.white,
          border:  Border.all(
            color: isSelected ? Palette.transparent : Palette.greyContainer.withOpacity(.5),
            width: .5.w,
          ),
        ),
        child: Row(
          children: [
            Image.network(
              image,
              color: isSelected ? Palette.greyText : Palette.greyText,
            ).marginOnly(right: 1.w),
            Texts.regular(
              categoryModel.name,
              fontSize: 12,
              color: isSelected ? Palette.greyText : Palette.greyText,
            ),
          ],
        ),
      ),
    );
  }
}
