import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Admin/Controllers/admin_controller.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class AddProductView extends GetView<AdminController> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.loading()) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Texts.bold(
                  "Selecciona el producto",
                  fontSize: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        items: controller.assets
                            .map(
                              (element) => DropdownMenuItem(
                                value: element.iconUrl,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(element.iconUrl),
                                    Texts.regular(
                                      element.name,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.iconUrlSelected(value);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await controller.getAssets();
                        controller.categories.addAll(
                          await controller.homeController.getCategories(),
                        );
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.h,
                  width: 80.w,
                  margin: EdgeInsets.symmetric(
                    vertical: 3.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Palette.blueBlack,
                      width: 1.w,
                    ),
                  ),
                  child: Obx(
                    () => controller.iconUrlSelected().isEmpty
                        ? const SizedBox.shrink()
                        : Image.network(
                            controller.iconUrlSelected(),
                          ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Texts.bold(
                    "Categoria",
                    fontSize: 10,
                  ),
                ).marginOnly(bottom: 1.h),
                SizedBox(
                  width: double.infinity,
                  height: 4.h,
                  child: DropdownButton(
                    isExpanded: true,
                    style: TextStyle(fontSize: 20.sp),
                    iconSize: 20.sp,
                    elevation: 0,
                    value: controller.categorySelected().isEmpty
                        ? null
                        : controller.categorySelected(),
                    items: controller.categories
                        .map(
                          (element) => DropdownMenuItem(
                            value: Util.categoryToString(element.tag),
                            child: Texts.regular(element.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.categorySelected(value);
                    },
                  ),
                ).marginOnly(bottom: 1.h),
                CustomInput(
                  hinttext: "Nombre del producto",
                  controller: controller.nameProductController,
                ).marginOnly(bottom: 2.h),
                CustomInput(
                  controller: controller.shortDescriptionController,
                  hinttext: "Breve descripcion del producto",
                ).marginOnly(bottom: 2.h),
                CustomInput(
                  controller: controller.descriptionController,
                  hinttext: "Descripcion del producto",
                ).marginOnly(bottom: 2.h),
                CustomInput(
                  controller: controller.priceController,
                  hinttext: "Precio del producto",
                ).marginOnly(bottom: 3.h),
                CustomButton(
                  buttonText: "Guardar",
                  onPressed: () => controller.saveProduct(),
                ),
              ],
            ).paddingSymmetric(vertical: 4.h, horizontal: 10.w),
          ),
        );
      }),
    );
  }
}
