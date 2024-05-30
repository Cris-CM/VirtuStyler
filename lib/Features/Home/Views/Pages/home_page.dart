import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/category_item.dart';
import 'package:virtustyler/Features/Home/Widgets/product_item.dart';
import 'package:virtustyler/core/Util/get_image.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                FutureBuilder(
                    future: controller.getCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 4.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future:
                                    GetImage.get(snapshot.data![index].imageId),
                                builder: (context, snapshotImage) {
                                  if (snapshotImage.hasData) {
                                    return CategoryItem(
                                      image: snapshotImage.data!,
                                      categoryModel: snapshot.data![index],
                                    );
                                  }

                                  return const SizedBox.shrink();
                                },
                              );
                            },
                          ),
                        ).marginOnly(bottom: 4.h);
                      }
                      return const CircularProgressIndicator();
                    }),
                const Texts.bold(
                  'Tendencias actualizadas',
                  fontSize: 14,
                ).marginOnly(bottom: 2.h),
                SizedBox(
                  width: double.infinity,
                  height: 20.h * 5,
                  child: GridView.builder(
                    padding: EdgeInsets.only(right: 5.w),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                      crossAxisSpacing: 5.w,
                      mainAxisSpacing: 4.h,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProductItem();
                    },
                  ),
                ),
              ],
            ).paddingOnly(top: 2.h, left: 5.w),
          ),
        ),
      ),
    );
  }
}
