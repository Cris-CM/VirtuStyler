import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Views/product_view.dart';

class ProductOfert extends StatelessWidget {
  const ProductOfert({Key? key, required this.assetModel}) : super(key: key);

  final AssetModel assetModel;

  @override
  Widget build(BuildContext context) {
    int descount = Random().nextInt(10);

    double originalPrice = assetModel.productModel!.price.toDouble();
    double discountedPrice =
        originalPrice * (descount / 100); // 20% de descuento

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductView(assetModel, descount.toDouble()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Palette.greyContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 17.h, // Ajusta según el tamaño deseado de la imagen
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(assetModel.iconUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.h,
                    horizontal: 3.w,
                  ),
                  margin: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Palette.red,
                        Palette.red.withOpacity(0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Texts(
                    '${100 - descount}%',
                    fontSize: 6.sp,
                    fontWeight: FontWeight.bold,
                    color: Palette.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.regular(
                  assetModel.productModel!.name,
                  fontSize: 10,
                  color: Palette.greyText,
                ).marginOnly(left: 2.w, bottom: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Texts.bold(
                      'S/. ${discountedPrice.toStringAsFixed(2)}',
                      fontSize: 10,
                      color: Palette.greyText,
                    ).marginOnly(right: 2.w),
                    Text(
                      'S/. $originalPrice',
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: Palette.greyText,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
