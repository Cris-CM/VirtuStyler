import 'package:flutter/material.dart';
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
  });
  final CategoryModel categoryModel;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Palette.white,
      ),
      child: Row(
        children: [
          image.marginOnly(right: 3.w),
          Texts.regular(
            categoryModel.name,
            fontSize: 12,
            color: Palette.blueBlack,
          ),
        ],
      ),
    );
  }
}
