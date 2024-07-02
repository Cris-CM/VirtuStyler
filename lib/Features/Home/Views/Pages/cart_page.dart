import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/asset_item.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';

class CartPage extends GetView<HomeController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          log(controller.urlAvatar());
          return Expanded(
            flex: 5,
            child: O3D.network(
              src: controller.urlAvatar(),
              onWebViewCreated: (value) {
                controller.setWebviewController(value);
              },
            ),
          );
        }),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.assets.length,
            itemBuilder: (context, index) {
              return AssetItem(
                model: controller.assets[index],
                onTap: () {
                  controller.setAsset(controller.assets[index].id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
