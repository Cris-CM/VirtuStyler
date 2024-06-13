import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Models/product_model.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';
import 'package:virtustyler/core/Util/util.dart';

class ProductView extends GetView<HomeController> {
  const ProductView(this.productModel, {super.key});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
        buttonText: "Comprar",
        onPressed: () {
          Get.toNamed("/factura");
        },
      ).marginSymmetric(vertical: 3.h, horizontal: 10.w),
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        shadowColor: Palette.background,
        elevation: 3,
        title: Image.asset(
          'assets/images/logo.png',
          height: 5.h,
        ),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: Util.getImage(productModel.imageId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        snapshot.data!,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        height: 40.h,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Texts.regular(
                productModel.subName,
                color: Palette.greyBlack,
                fontSize: 8,
              ).marginOnly(bottom: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Texts.bold(
                    productModel.name,
                    fontSize: 14,
                  ),
                  Texts.bold(
                    "S/. ${productModel.price}",
                    fontSize: 14,
                  ),
                ],
              ).marginOnly(bottom: 2.h),
              const Texts.bold(
                "Tamaño",
                fontSize: 12,
              ).marginOnly(bottom: 2.h),
              SizedBox(
                height: 10.w,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: controller.listSizes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 10.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Texts.bold(
                        controller.listSizes[index],
                        fontSize: 16,
                      ),
                    );
                  },
                ),
              ).marginOnly(bottom: 2.h),
              const Texts.bold(
                "Descripcion",
                fontSize: 12,
              ).marginOnly(bottom: 2.h),
              const Texts.regular(
                "La sudadera con capucha Nike Throwback está confeccionada con tejido French Terry de primera calidad.",
                fontSize: 10,
                color: Palette.greyBlack,
                height: 1.4,
              ).marginOnly(bottom: 2.h),
            ],
          ).paddingSymmetric(horizontal: 5.w),
        ),
      ),
    );
  }
}
