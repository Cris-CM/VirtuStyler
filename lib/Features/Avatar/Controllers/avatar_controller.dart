import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';
import 'package:virtustyler/core/models/user_model.dart';
import 'package:virtustyler/core/models/anonymous_user_model.dart';
import 'package:virtustyler/core/models/avatar_template_model.dart';
import 'package:virtustyler/Features/Avatar/Views/avatar_preview_view.dart';
import 'package:virtustyler/core/Network/dio.dart';

const domain = "VirtuStyler";

class AvatarController extends GetxController {
  late AnonymousUserModel anonymousUser;
  final avatarsTemlate = <AvatarTemplateModel>[].obs;
  final loading = true.obs;
  var imagePerson = "".obs;
  late AvatarTemplateModel avatarTemplateModel;
  final firebaseAuth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  @override
  void onInit() async {
    await createAnonymousUser();
    super.onInit();
  }

  checkAuthAvatar() async {
    if (authController.userModel.avatarId == null) return;
  }

  createAnonymousUser() async {
    try {
      final response = await dio.post(
        "https://$domain.readyplayer.me/api/users",
      );

      anonymousUser = AnonymousUserModel.fromJson(
        response.data["data"],
      );
    } finally {
      loading(false);
    }
  }

  getPhotoPerson() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    imagePerson(image.path);
    imagePerson.refresh();
  }

  getAvatarToPhoto() async {
    final bytes = await File(imagePerson()).readAsBytes();

    final data = {
      "data": {
        "assets": {},
        "base64Image": base64Encode(bytes),
        "bodyType": "fullbody",
        "partner": "virtustyler",
        "userId": anonymousUser.id,
      }
    };

    final response = await dio.post(
      "https://api.readyplayer.me/v2/avatars",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${anonymousUser.token}",
        },
      ),
    );

   final saveResponse = await dio.put(
      "https://api.readyplayer.me/v2/avatars/${response.data["data"]["id"]}",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${anonymousUser.token}",
        },
      ),
    );

    avatarTemplateModel = AvatarTemplateModel.fromJson(saveResponse.data["data"]);
    await saveAvatarId();

    Get.to(() => const AvatarPreviewView());
  }

  saveAvatarId() async {
    final data = await firebase
        .collection("users")
        .where("uid", isEqualTo: firebaseAuth.currentUser!.uid)
        .get();

    final user = UserModel.fromJson(data.docs.first.data());

    final nUser = user.copyWith(avatarId: avatarTemplateModel.id);

    await firebase.collection("users").doc(nUser.id!).set(nUser.toJson());

    authController.userModel = authController.userModel.copyWith(
      avatarId: avatarTemplateModel.id,
    );
  }
}
