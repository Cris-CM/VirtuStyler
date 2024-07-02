import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/product_ofert.dart'; // Importa ProductOfert
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const Texts.bold(
                      'Ofertas',
                      fontSize: 20,
                    ).marginOnly(bottom: 0.5.h),
                    Container(
                      width: 25.h,
                      height: 1.w,
                      color: Palette.black,
                    ),
                  ],
                ),
              ).marginOnly(bottom: 1.h),
              Obx(() {
                if (homeController.filteredAssets.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  height: 45.h * homeController.filteredAssets.length,
                  child: GridView.builder(
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 11,
                      crossAxisSpacing: 5.w,
                      mainAxisSpacing: 4.h,
                    ),
                    itemCount: homeController.filteredAssets.length,
                    itemBuilder: (context, index) {
                      return ProductOfert(
                        assetModel: homeController.filteredAssets[index],
                      );
                    },
                  ),
                );
              }),
            ],
          ).paddingOnly(top: 2.h, left: 5.w, right: 5.w),
        ),
      ),
    );
  }
}
