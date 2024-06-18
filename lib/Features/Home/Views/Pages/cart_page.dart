import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/asset_item.dart';

class CartPage extends GetView<HomeController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: O3D.network(
            src:
                "https://api.readyplayer.me/v2/avatars/${controller.avatarController.avatarTemplateModel.id}.glb?preview=true",
          ),
        ),
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
