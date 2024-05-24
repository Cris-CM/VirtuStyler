import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
