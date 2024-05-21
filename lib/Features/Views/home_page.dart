import 'package:flutter/material.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';
import 'package:virtustyler/core/widgets/icon_and_text.dart';
import 'package:virtustyler/core/widgets/list_outits.dart';
import 'package:virtustyler/core/widgets/textFields/text_imput.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  DrawerControl drawerControl = DrawerControl();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteGrey,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Palette.black, // Color de fondo del BottomNavigationBar
        selectedItemColor: Palette.white, // Color de ícono seleccionado
        unselectedItemColor: Palette.white, // Color de ícono no seleccionado
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Palette.blackOpacity,
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: 'Escanear/Pago',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favoritos',
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flutter3dDrawer(
                controller: drawerControl,
                maxSlide: MediaQuery.of(context).size.width * 0.7,
                body: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      height: 13.w,
                      decoration: const BoxDecoration(
                        color: Palette.whiteGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Palette.white05,
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 50,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 50,
                          ),
                        ],
                      ),
                    ).marginOnly(bottom: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Lalo!',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          const CustomText(
                            text: 'Bienvenido a VirtuStyler',
                            fontSize: 27,
                          ).marginOnly(bottom: 30),
                          const TextImput(
                            hinttext: 'Search...',
                            obscureText: false,
                            showSearchIcon: true,
                          ).marginOnly(bottom: 30),
                          const CustomText(
                            text: 'Elige una prenda',
                            fontSize: 27,
                          ),
                          Container(
                            height: 4.h,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/camisa.png',
                                        fit: BoxFit.cover,
                                      ).marginOnly(right: 10),
                                      const CustomText(
                                        text: 'camisa',
                                        fontSize: 22,
                                        color: Palette.blueBlack,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const CustomText(
                            text: 'Tendencias actualizadas',
                            fontSize: 27,
                          ),
                          Container(
                            color: Palette.whiteGrey,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            height: 80.h,
                            width: 80.h,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 7,
                                mainAxisExtent: 440,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return const ListOutfits();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                drawer: Container(
                  height: 90.h,
                  color: Palette.white,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 50,
                      ).marginOnly(bottom: 40),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Palette.white,
                          ),
                        ),
                        title: const CustomText(
                          text: 'Lalo',
                          fontSize: 30,
                        ),
                        subtitle: const CustomText(
                          text: 'Perfil Verificado',
                          fontSize: 20,
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.whiteGrey,
                          ),
                          child: const CustomText(
                            text: '3 Orders',
                            fontSize: 15,
                            color: Palette.blueBlack,
                          ),
                        ),
                      ).marginOnly(bottom: 20),
                      const IconAndText(
                        text: 'Informacion de la cuenta',
                        iconData: Icons.settings,
                        fontSize: 25,
                      ).marginOnly(bottom: 15),
                      const IconAndText(
                        text: 'Contraseña',
                        iconData: Icons.lock,
                        fontSize: 25,
                      ).marginOnly(bottom: 15),
                      const IconAndText(
                        text: 'Compras y devoluciones',
                        iconData: Icons.shopping_bag_outlined,
                        fontSize: 25,
                      ).marginOnly(bottom: 15),
                      const IconAndText(
                        text: 'Forma de pago',
                        iconData: Icons.payment,
                        fontSize: 25,
                      ).marginOnly(bottom: 15),
                      const IconAndText(
                        text: 'Configuracion',
                        iconData: Icons.settings,
                        fontSize: 25,
                      ),
                      const Spacer(),
                      const IconAndText(
                        text: 'Cerrar Session',
                        iconData: Icons.logout,
                        fontSize: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
