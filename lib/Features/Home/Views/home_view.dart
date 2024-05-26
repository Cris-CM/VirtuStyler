import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Views/home_page.dart';
import 'package:virtustyler/core/colors/palette.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Palette.background,
        color: Palette.greyBlack,
        activeColor: Palette.blackOpacity,
        
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.qr_code_scanner_sharp, title: 'Escanear'),
          TabItem(icon: Icons.shopping_bag_sharp, title: 'Comprar'),
          TabItem(icon: Icons.person, title: 'Perfil'),
          TabItem(icon: Icons.favorite, title: 'Favoritos'),
        ],
        onTap: (int i) => controller.pageController.jumpToPage(i),
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          HomePage(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
