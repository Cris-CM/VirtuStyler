import 'package:get/get.dart';
import 'package:virtustyler/Features/Avatar/Controllers/avatar_controller.dart';

class AvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarController());
  }
}
