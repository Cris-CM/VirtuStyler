import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Models/product_model.dart';
import 'package:virtustyler/Features/Home/Views/product_view.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductView(productModel));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: Util.getImage(productModel.imageId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Texts.regular(
              productModel.name,
              fontSize: 10,
            ).marginOnly(left: 2.w, bottom: 1.h, top: 1.h),
              Texts.bold(
              'S/. ${productModel.price}',
              fontSize: 12,
            ).marginOnly(left: 2.w, bottom: 2.h, top: 1.h),
          ],
        ),
      ),
    );
  }
}
