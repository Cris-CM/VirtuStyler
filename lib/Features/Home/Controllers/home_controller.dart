import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/Features/Home/Models/asset_model.dart';
import 'package:virtustyler/Features/Home/Models/category_model.dart';
import 'package:virtustyler/Features/Home/Models/product_model.dart';
import 'package:virtustyler/core/Network/dio.dart';
import 'package:virtustyler/core/Util/tabs.dart';
import 'package:virtustyler/core/Util/util.dart';

const avatarId = "6648e5294c3b647e2d5270e8";

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final authController = Get.find<AuthController>();
  final firebase = FirebaseFirestore.instance;
  late TabController tapController;
  DrawerControl drawerControl = DrawerControl();
  final pageController = PageController();
  final pageIndex = 0.obs;
  final listSizes = <String>["S", "M", "L", "XL"];
  final products = <ProductModel>[].obs;
  final categories = <CategoryModel>[].obs;
  late Rx<CategoryModel> categorySelected;

  @override
  Future<void> onInit() async {
    tapController = TabController(
      length: tabs.length,
      vsync: this,
    );
    await getCategories();
    await getProducts();

    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      categories.clear();
      final categoriesJson = await firebase.collection("categories").get();

      final list = (categoriesJson.docs as List)
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      final name = list.firstWhere((element) => element.name == "Todo");

      list.removeWhere((element) => element.name == "Todo");

      list.insert(0, name);

      categories.addAll(list);
      categorySelected = categories.first.obs;
    } catch (e) {
      Util.errorSnackBar("Error al obtener categorias.");
    }
  }

  Future<void> getProducts({String? categoryId}) async {
    try {
      products.clear();

      late QuerySnapshot<Map<String, dynamic>> productsJson;

      if (categoryId != null && categoryId.isNotEmpty) {
        productsJson = await firebase
            .collection("Products")
            .where("categoryId", isEqualTo: categoryId)
            .get();
      } else {
        productsJson = await firebase.collection("Products").get();
      }

      products.addAll(
        productsJson.docs
            .map(
              (e) => ProductModel.fromJson(e.data()),
            )
            .toList(),
      );
    } catch (e) {
      Util.errorSnackBar("Error al obtener productos.");
    }
  }

  final loadingCart = true.obs;
  final assets = <AssetModel>[].obs;
  final avatarPath = "".obs;
  O3DController controller = O3DController();

  Future<void> getPlayer() async {
    try {
      //    final directory = await getApplicationDocumentsDirectory();
      //  final filePath = '${directory.path}/$avatarId.glb';

      // await dio.download(
      //   "https://models.readyplayer.me/$avatarId.glb?quality=low",
      //   filePath,
      // );

      // avatarPath(filePath);
    } finally {}
  }

  Future<void> setAsset(String assetId) async {
    try {
      final data = {
        "data": {"assetId": assetId}
      };

      await dio.put(
        "https://api.readyplayer.me/v1/avatars/$avatarId/equip",
        data: data,
      );

      // Get.offAll(const LoadingView());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAssets() async {
    try {
      final response = await dio.get(
        "https://api.readyplayer.me/v1/assets",
        queryParameters: {
          "organizationId": "6648dd15a6802933324ab318",
        },
      );

      final assetsT = (response.data["data"] as List)
          .map((e) => AssetModel.fromJson(e))
          .toList();

      assets(assetsT);
    } finally {}
  }

  Future<void> logout() async {
    Get.toNamed("/login");
    await FirebaseAuth.instance.signOut();
  }
}
