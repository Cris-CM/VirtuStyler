import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Models/user_model.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final emailLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  final nameRegisterController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;

  final loading = false.obs;
  late UserModel userModel;

  Future<void> login() async {
    try {
      loading(true);

      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      );

      final userJson = await firebase
          .collection("users")
          .where("id", isEqualTo: user.user!.uid)
          .get();

      userModel = UserModel.fromJson(userJson.docs.first.data());

      Get.toNamed("/home");
      Util.successSnackBar("Autenticado Correctamente");
    } catch (e) {
      Util.errorSnackBar("Credenciales Incorrectas");
    } finally {
      loading(false);
    }
  }

  Future<void> register() async {
    try {
      loading(true);

      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailRegisterController.text,
        password: passwordRegisterController.text,
      );

      final userModelT = UserModel(
        id: user.user!.uid,
        name: nameRegisterController.text,
      );

      await firebase.collection("users").add(
            userModelT.toJson(),
          );

      Get.toNamed("/login");
      Util.successSnackBar("Registrado Correctamente");
    } on FirebaseAuthException catch (e) {
      Util.errorSnackBar(e.message ?? "Error desconocido");
    } finally {
      loading(false);
    }
  }
}
