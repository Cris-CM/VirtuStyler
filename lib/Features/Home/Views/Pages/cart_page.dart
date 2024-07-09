import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/asset_item.dart';

class CartPage extends GetView<HomeController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          log(controller.urlAvatar());
          return Expanded(
            child: O3D.network(
              src: controller.urlAvatar(),
              onWebViewCreated: (value) {
                controller.setWebviewController(value);
              },
            ),
          );
        }),
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.cartAssets.length,
            itemBuilder: (context, index) {
              return AssetItem(
                model: controller.cartAssets[index],
                onTap: () {
                  controller.setAsset(controller.cartAssets[index].id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
