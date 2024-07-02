import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:o3d/o3d.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/Features/Avatar/Controllers/avatar_controller.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/models/category_model.dart';
import 'package:virtustyler/core/models/product_model.dart';
import 'package:virtustyler/core/Network/dio.dart';
import 'package:virtustyler/core/Util/const.dart';
import 'package:virtustyler/core/Util/tabs.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:webview_flutter/src/webview_controller.dart';

 
class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final avatarController = Get.find<AvatarController>();

  final authController = Get.find<AuthController>();
  final firebase = FirebaseFirestore.instance;
  late TabController tapController;
  DrawerControl drawerControl = DrawerControl();
  final pageController = PageController();
  final pageIndex = 0.obs;
  final listSizes = <String>["S", "M", "L", "XL"];
  final categories = <CategoryModel>[].obs;
  late Rx<CategoryModel> categorySelected;
  final loadingCart = true.obs;
  final assets = <AssetModel>[].obs;
  final avatarPath = "".obs;
  O3DController controller = O3DController();
  final urlAvatar = "".obs;
  late WebViewController webViewController;

  @override
  Future<void> onInit() async {
    urlAvatar(
      "https://api.readyplayer.me/v2/avatars/${avatarController.avatarTemplateModel.id}.glb",
    );
    tapController = TabController(
      length: tabs.length,
      vsync: this,
    );
    categories.addAll(await getCategories());
    categorySelected = categories.first.obs;
    await getAssets();
    super.onInit();
  }

  setWebviewController(WebViewController a) {
    webViewController = a;
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final categoriesJson = await firebase.collection("categories").get();

      final list = (categoriesJson.docs as List)
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return list;
    } catch (e) {
      Util.errorSnackBar("Error al obtener categorias.");
      return [];
    }
  }

  Future<ProductModel?> getProduct(String avatarId) async {
    try {
      final productsJson = await firebase
          .collection("products")
          .where("avatarId", isEqualTo: avatarId)
          .get();

      if (productsJson.docs.isEmpty) return null;

      return ProductModel.fromJson(
        productsJson.docs.first.data(),
      );
    } catch (e) {
      Util.errorSnackBar("Error al obtener productos.");
      return null;
    }
  }

  Future<void> setAsset(String assetId) async {
    try {
      log(authController.userModel.avatarId!);
      final data = {
        "data": {"assetId": assetId}
      };

      await dio.put(
        "https://api.readyplayer.me/v1/avatars/${authController.userModel.avatarId}/equip",
        data: data,
      );
 
     await webViewController.reload();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAssets({CategoryType? type}) async {
    try {
      assets.clear();
      final url = type != null
          ? "https://api.readyplayer.me/v1/assets?type=${Util.categoryToString(type).toLowerCase()}"
          : "https://api.readyplayer.me/v1/assets";

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
        if (!element.iconUrl.contains(".glb")) {
          final prod = await getProduct(element.id);
          assets.add(element.copyWith(productModel: prod));
        }
      }
    } finally {}
  }

  Future<void> logout() async {
    Get.toNamed("/login");
    await FirebaseAuth.instance.signOut();
  }

  createPaymentIntent(String amount) async {
    try {
      Map<String, dynamic> body = {
        // Amount must be in smaller unit of currency
        // so we have multiply it by 100
        'amount': ((int.parse(amount)) * 100).toString(),
        'currency': "USD",
        'payment_method_types[]': 'card',
      };
      var secretKey = dotenv.get("STRIPE_SECRET");

      final response = await Dio().post(
        "https://api.stripe.com/v1/payment_intents",
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $secretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );

      print('Payment Intent Body: ${response.data.toString()}');
      return response.data;
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }

  Map<String, dynamic>? paymentIntent;

  displayPaymentSheet(ProductModel productModel) async {
    try {
      // "Display payment sheet";
      await Stripe.instance.presentPaymentSheet();

      paymentIntent = null;

      Get.toNamed("/factura", arguments: productModel);
    } on StripeException catch (e) {
      // If any error comes during payment
      // so payment will be cancelled
      print('Error: $e');
    } catch (e) {
      print("Error in displaying");
      print('$e');
    }
  }

  Future<void> makePayment(ProductModel productModel) async {
    try {
      // Create payment intent data
      paymentIntent = await createPaymentIntent(productModel.price.toString());
      // initialise the payment sheet setup
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Client secret key from payment data
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
              // Currency and country code
              // is accourding to India
              testEnv: true,
              currencyCode: "USD",
              merchantCountryCode: "US"),
          // Merchant Name
          merchantDisplayName: 'Flutterwings',
// return URl if you want to add
          // returnURL: 'flutterstripe://redirect',
        ),
      );
      //Display payment sheet
      displayPaymentSheet(productModel);
    } catch (e) {
      print("exception $e");

      if (e is StripeConfigException) {
        print("Stripe exception ${e.message}");
      } else {
        print("exception $e");
      }
    }
  }
}
