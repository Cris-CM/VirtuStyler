import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Widgets/product_ofert.dart';
import 'package:virtustyler/core/colors/palette.dart';

import '../../../../core/widgets/texts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    )
                  ],
                ),
              ).marginOnly(bottom: 1.h),
              Container(
                height: 5.h,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Palette.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 20.h,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        border: index == 2
                            ? Border.all(color: Palette.blue, width: 0.8.w)
                            : null,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Texts.bold(
                          '20 %',
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ).paddingOnly(left: 5.w, right: 2.w),
              SizedBox(
                width: double.infinity,
                height: 20.h * 5,
                child: GridView.builder(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 16,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.h,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductOfert();
                  },
                ),
              ),
            ],
          ).paddingOnly(top: 2.h, left: 5.w, right: 5.w),
        ),
      ),
    );
  }
}
