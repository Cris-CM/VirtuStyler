import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/models/user_model.dart';
import 'package:virtustyler/Features/Avatar/Controllers/avatar_controller.dart';
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
          .where("uid", isEqualTo: user.user!.uid)
          .get();

      userModel = UserModel.fromJson(userJson.docs.first.data());
      Get.put(AvatarController());
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
        uid: user.user!.uid,
        name: nameRegisterController.text,
      );

      final userSaved = await firebase.collection("users").add(
            userModelT.toJson(),
          );

      final nUserModel = userModelT.copyWith(id: userSaved.id);

      await firebase.collection("users").doc(nUserModel.id!).set(
            nUserModel.toJson(),
          );

      final userJson =
          await firebase.collection("users").doc(nUserModel.id!).get();

      userModel = UserModel.fromJson(userJson.data()!);

      Get.toNamed("/avatar");
      Util.successSnackBar("Registrado Correctamente");
    } on FirebaseAuthException catch (e) {
      Util.errorSnackBar(e.message ?? "Error desconocido");
    } finally {
      loading(false);
    }
  }
}
