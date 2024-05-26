import 'package:get/get.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
