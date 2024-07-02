import 'package:get/get.dart';
import 'package:virtustyler/Features/Admin/Controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminController());
  }
}
