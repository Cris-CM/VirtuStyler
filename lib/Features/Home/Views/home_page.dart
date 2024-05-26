import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/Features/Home/Controllers/home_controller.dart';
import 'package:virtustyler/Features/Home/Widgets/category_item.dart';

import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/icon_and_text.dart';
import 'package:virtustyler/Features/Home/Widgets/product_item.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import 'package:virtustyler/core/widgets/texts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SafeArea(
          child: Flutter3dDrawer(
            controller: controller.drawerControl,
            backgroundColor: Palette.background,
            maxSlide: 60.w,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texts.bold(
                    'Hola! Ericka',
                    fontSize: 14,
                  ).marginOnly(bottom: 2.h),
                  const Texts.bold(
                    'Bienvenido a VirtyStyler',
                    fontSize: 14,
                  ).marginOnly(bottom: 4.h),
                  Row(
                    children: [
                      const Expanded(
                        child: CustomInput(
                          hinttext: 'Search...',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 4.h, right: 5.w),
                  const Texts.bold(
                    'Categorias',
                    fontSize: 14,
                  ).marginOnly(bottom: 2.h),
                  SizedBox(
                    height: 4.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const CategoryItem();
                      },
                    ),
                  ).marginOnly(bottom: 4.h),
                  const Texts.bold(
                    'Tendencias actualizadas',
                    fontSize: 14,
                  ).marginOnly(bottom: 2.h),
                  SizedBox(
                    width: double.infinity,
                    height: 20.h * 5,
                    child: GridView.builder(
                      padding: EdgeInsets.only(right: 5.w),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 16,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 4.h,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const ProductItem();
                      },
                    ),
                  ),
                ],
              ).paddingOnly(top: 2.h, left: 5.w),
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
        ),
      ),
    );
  }
}
