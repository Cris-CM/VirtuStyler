import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtustyler/Features/Home/Models/image_model.dart';

class GetImage {
  static Future<Image> get(String? id) async {
    if (id == null) {
      return Image.asset(
        'assets/icons/camisa.png',
        fit: BoxFit.cover,
      );
    }

    final image =
        await FirebaseFirestore.instance.collection("images").doc(id).get();

    final imageM = ImageModel.fromJson(image.data()!);

    return Image.network(
      imageM.url,
      fit: BoxFit.cover,
    );
  }
}
