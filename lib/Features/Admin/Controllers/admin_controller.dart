import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/core/Network/dio.dart';
import 'package:virtustyler/core/Util/const.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/models/category_model.dart';
import 'package:virtustyler/core/models/product_model.dart';

class AdminController extends GetxController {
  final assets = <AssetModel>[].obs;
  final loading = true.obs;
  final iconUrlSelected = "".obs;
  final categorySelected = "".obs;

  final firebase = FirebaseFirestore.instance;
  final nameProductController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final categories = <CategoryModel>[].obs;
  final homeController = Get.find<HomeController>();

  @override
  Future<void> onInit() async {
    categories.addAll(await homeController.getCategories());
    await getAssets();
    loading(false);
    super.onInit();
  }

  Future<void> getAssets({CategoryType? type}) async {
    try {
      loading(true);
      assets.clear();

      final productsResponse = await firebase.collection("products").get();

      final productsModel = productsResponse.docs.map(
        (e) => ProductModel.fromJson(e.data()),
      );

      const url = "https://api.readyplayer.me/v1/assets";

      final response = await dio.get(
        url,
        queryParameters: {
          "organizationId": "6648dd15a6802933324ab318",
        },
      );

      final assetsT = (response.data["data"] as List)
          .map(
            (e) => AssetModel.fromJson(e),
          )
          .toList();

      for (var element in assetsT) {
        if (!element.iconUrl.contains(".glb") &&
            !productsModel.any((e) => e.avatarId == element.id)) {
          assets.add(element);
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading(false);
    }
  }

  saveProduct() async {
    try {
      final assetModel = assets
          .where(
            (p0) => p0.iconUrl == iconUrlSelected(),
          )
          .first;

      final productModel = ProductModel(
        avatarId: assetModel.id,
        price: int.parse(priceController.text),
        name: nameProductController.text,
        categoryId: "categoryId",
        subName: shortDescriptionController.text,
        description: descriptionController.text,
      );

      await firebase.collection("products").add(productModel.toJson());
      clear();
      await getAssets();
    } finally {
      loading(false);
    }
  }

  clear() {
    iconUrlSelected("");
    categorySelected("");
    nameProductController.text = "";
    shortDescriptionController.text = "";
    descriptionController.text = "";
    priceController.text = "";
  }
}
