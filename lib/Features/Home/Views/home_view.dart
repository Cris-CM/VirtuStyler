import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Views/Pages/home_page.dart';
import 'package:virtustyler/Features/Home/Views/Pages/perfil_page.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/icon_and_text.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        shadowColor: Palette.background,
        elevation: 3,
        title: Image.asset(
          'assets/images/logo.png',
          height: 5.h,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            controller.drawerControl.toggle();
          },
          icon: Icon(
            Icons.menu,
            size: 20.sp,
            color: Palette.black,
          ),
        ),
      ),
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
      body: Flutter3dDrawer(
        controller: controller.drawerControl,
        backgroundColor: Palette.background,
        maxSlide: 60.w,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            HomePage(),
            Container(),
            Container(),
            ProfilePage(),
            Container(),
          ],
        ),
        drawer: Container(
          padding: EdgeInsets.only(bottom: 4.h),
          color: Palette.pink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                leading: CircleAvatar(
                  backgroundColor: Palette.brown,
                  radius: 15.sp,
                  child: Icon(
                    Icons.person,
                    size: 10.sp,
                    color: Palette.white,
                  ),
                ),
                title: const Texts.regular(
                  'Ericka',
                  fontSize: 10,
                ),
                subtitle: Row(
                  children: [
                    const Texts.regular(
                      'Perfil Verificado',
                      fontSize: 9,
                      color: Palette.greyBlack,
                    ).marginOnly(right: 1.w),
                    Icon(
                      Icons.verified,
                      color: Palette.darkGreen,
                      size: 10.sp,
                    ),
                  ],
                ),
              ).marginOnly(bottom: 4.h),
              const IconAndText(
                text: 'Informacion de la cuenta',
                iconData: Icons.settings,
                fontSize: 10,
              ).marginOnly(bottom: 3.h),
              const IconAndText(
                text: 'Contraseña',
                iconData: Icons.lock,
                fontSize: 10,
              ).marginOnly(bottom: 3.h),
              const IconAndText(
                text: 'Compras y devoluciones',
                iconData: Icons.shopping_bag_outlined,
                fontSize: 10,
              ).marginOnly(bottom: 3.h),
              const IconAndText(
                text: 'Forma de pago',
                iconData: Icons.payment,
                fontSize: 10,
              ).marginOnly(bottom: 3.h),
              const IconAndText(
                text: 'Configuracion',
                iconData: Icons.settings,
                fontSize: 10,
              ),
              const Spacer(),
              const IconAndText(
                text: 'Cerrar Session',
                iconData: Icons.logout,
                fontSize: 10,
                color: Palette.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
