import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/category_item.dart';
import 'package:virtustyler/Features/Home/Widgets/product_item.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getProducts();
    controller.getCategories();
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getCategories();
              await controller.getProducts();
            },
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.bold(
                      'Hola! ${controller.authController.userModel.name}',
                      fontSize: 14,
                    ).marginOnly(bottom: 1.h),
                    const Texts.regular(
                      'Bienvenido a VirtyStyler',
                      fontSize: 14,
                      color: Palette.greyBlack,
                    ).marginOnly(bottom: 4.h),
                    Row(
                      children: [
                        const Expanded(
                          child: CustomInput(
                            hinttext: 'Search...',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 4.h, right: 5.w),
                    const Texts.bold(
                      'Categorias',
                      fontSize: 14,
                    ).marginOnly(bottom: 2.h),
                    SizedBox(
                      height: 4.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: Util.getImage(
                                controller.categories[index].imageId),
                            builder: (context, snapshotImage) {
                              if (snapshotImage.hasData) {
                                return Obx(() {
                                  return CategoryItem(
                                    image: snapshotImage.data!,
                                    categoryModel: controller.categories[index],
                                    isSelected: controller.categorySelected() ==
                                        controller.categories[index],
                                    onTap: () async{
                                      controller.categorySelected(
                                          controller.categories[index]);

                                     await controller.getProducts(
                                        categoryId:
                                            controller.categorySelected().id,
                                      );
                                    },
                                  );
                                });
                              }

                              return const SizedBox.shrink();
                            },
                          );
                        },
                      ),
                    ).marginOnly(bottom: 4.h),
                    const Texts.bold(
                      'Tendencias actualizadas',
                      fontSize: 14,
                    ).marginOnly(bottom: 2.h),
                    SizedBox(
                      width: double.infinity,
                      height: 45.h * controller.products.length,
                      child: GridView.builder(
                        padding: EdgeInsets.only(right: 5.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9 / 16,
                          crossAxisSpacing: 5.w,
                          mainAxisSpacing: 4.h,
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return ProductItem(
                            productModel: controller.products[index],
                          );
                        },
                      ),
                    ),
                  ],
                ).paddingOnly(top: 2.h, left: 5.w),
              );
            }),
          ),
        ),
      ),
    );
  }
}
