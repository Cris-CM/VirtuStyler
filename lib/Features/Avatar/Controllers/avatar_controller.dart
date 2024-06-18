import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtustyler/Features/Avatar/Models/anonymous_user_model.dart';
import 'package:virtustyler/Features/Avatar/Models/avatar_template_model.dart';
import 'package:virtustyler/Features/Avatar/Views/avatar_preview_view.dart';
import 'package:virtustyler/core/Network/dio.dart';

const domain = "VirtuStyler";

class AvatarController extends GetxController {
  late AnonymousUserModel anonymousUser;
  final avatarsTemlate = <AvatarTemplateModel>[].obs;
  final loading = true.obs;
  var imagePerson = Rx<XFile?>(null);
  late AvatarTemplateModel avatarTemplateModel;
  @override
  void onInit() async {
    await createAnonymousUser();
    super.onInit();
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

    imagePerson = image.obs;
    refresh();
    update();
  }

  getAvatarToPhoto() async {
    final bytes = await File(imagePerson()!.path).readAsBytes();

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

    avatarTemplateModel = AvatarTemplateModel.fromJson(response.data["data"]);

    Get.to(() => const AvatarPreviewView());
  }
}
