import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/Features/Home/Views/product_view.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.assetModel});
  final AssetModel assetModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductView(assetModel));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Palette.greyContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(assetModel.iconUrl),
            ),
            Texts.regular(
              assetModel.productModel!.name,
              fontSize: 10,
              color: Palette.greyText,
            ).marginOnly(left: 2.w, bottom: 1.h),
            Texts.bold(
              'S/. ${assetModel.productModel!.price}',
              fontSize: 11,
              color: Palette.greyText,
            ).marginOnly(left: 2.w, bottom: 2.h),
          ],
        ),
      ),
    );
  }
}
