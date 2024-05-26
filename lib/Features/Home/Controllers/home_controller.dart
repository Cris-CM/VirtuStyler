import 'package:flutter/widgets.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DrawerControl drawerControl = DrawerControl();
  final pageController = PageController();
  
  final pageIndex = 0.obs;
}
