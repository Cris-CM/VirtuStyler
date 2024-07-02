import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductView extends GetView<HomeController> {
  const ProductView(this.assetModel, {super.key});
  final AssetModel assetModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
        buttonText: "Comprar",
        onPressed: () async {
          //  await controller.makePayment(productModel);
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
              Align(
                  alignment: Alignment.center,
                  child: assetModel.iconUrl.contains(".glb")
                      ? O3D.network(
                          src: assetModel.modelUrl,
                          loading: Loading.lazy,
                          autoRotate: false,
                          cameraControls: false,
                        )
                      : Image.network(assetModel.iconUrl)),
              Texts.regular(
                assetModel.productModel!.subName,
                color: Palette.greyBlack,
                fontSize: 8,
              ).marginOnly(bottom: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Texts.bold(
                    assetModel.productModel!.name,
                    fontSize: 14,
                  ),
                  Texts.bold(
                    "S/. ${assetModel.productModel!.price}",
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
