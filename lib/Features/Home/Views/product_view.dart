import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class ProductView extends GetView<HomeController> {
  const ProductView(this.assetModel, this.descount, {super.key});
  final AssetModel assetModel;
  final double descount;
  @override
  Widget build(BuildContext context) {
    double discountedPrice = descount == 0
        ? assetModel.productModel!.price.toDouble()
        : assetModel.productModel!.price * (descount / 100); // 20% de descuento

    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          IconButton.filled(
            onPressed: () {
              if (controller.cartAssets.contains(assetModel)) {
                Util.errorSnackBar("Producto ya se encuentra agregado");
                return;
              }

              controller.cartAssets.add(assetModel);
              Util.successSnackBar("Producto agregado correctamente");
            },
            icon: Icon(
              Icons.add_shopping_cart,
              size: 20.sp,
            ),
          ).marginOnly(right: 3.w),
          Expanded(
            child: CustomButton(
              buttonText: "Comprar",
              onPressed: () async {
                await controller.makePayment(assetModel, discountedPrice);
              },
            ),
          ),
        ],
      ).marginSymmetric(vertical: 3.h, horizontal: 4.w),
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
                          src: assetModel.iconUrl,
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
                    "S/. ${discountedPrice.round()}",
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
