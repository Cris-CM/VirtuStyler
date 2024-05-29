import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/product_photo_item.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductView extends GetView<HomeController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Image.asset(
                'assets/images/model.png',
                fit: BoxFit.contain,
                height: 50.h,
                width: double.infinity,
              ),
              const Texts.regular(
                "Sudadera con capucha estampada para hombre",
                color: Palette.greyBlack,
                fontSize: 8,
              ).marginOnly(bottom: 1.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Texts.bold(
                    "Nike Club Fleece",
                    fontSize: 14,
                  ),
                  Texts.bold(
                    "S/. 100",
                    fontSize: 14,
                  ),
                ],
              ).marginOnly(bottom: 2.h),
              SizedBox(
                height: 14.h,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const ProductPhotoItem();
                    },
                  ),
                ),
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
              CustomButton(
                buttonText: "Agregar al carrito",
                onPressed: () {
                  controller.tapController.animateTo(3);
                  controller.pageController.jumpToPage(3);

                  Get.back();
                },
              ).marginSymmetric(vertical: 3.h),
            ],
          ).paddingSymmetric(horizontal: 5.w),
        ),
      ),
    );
  }
}
