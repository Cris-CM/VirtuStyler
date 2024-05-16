import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/my_outfits.dart';
import 'package:virtustyler/core/widgets/text_and_icon.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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
            icon: Icon(Icons.kitchen),
            label: 'Armario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Estrella',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensaje',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                const TextAndIconButton(
                  text: 'Calendario de trajes',
                  icons: [Icons.arrow_forward_ios],
                  iconColors: [Palette.white05],
                ).marginOnly(bottom: 15),
                Container(
                  height: 40.h,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Palette.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'Hoy, 1 de enero',
                              fontSize: 30,
                              color: Palette.blueBlack,
                            ).marginOnly(bottom: 20),
                            const CustomText(
                              text: 'Clima',
                              fontSize: 23,
                              color: Palette.white05,
                            ),
                            const CustomText(
                              text: '-3° a +8°',
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Palette.blueBlack,
                            ).marginOnly(bottom: 30),
                            const CustomText(
                              text: 'Probabilidad\nde precipitación',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Palette.white05,
                            ),
                            const CustomText(
                              text: '90%',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Palette.blueBlack,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 0.5,
                        height: double.infinity,
                        color: Palette.whiteOpacity,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/outfit.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(bottom: 30),
                TextAndIconButton(
                  text: 'Mis trajes',
                  icons: const [
                    Icons.add,
                    Icons.arrow_forward_ios,
                  ],
                  onPressed: () {
                    Get.toNamed('/list_outfits');
                  },
                  iconColors: const [
                    Palette.blueBlack,
                    Palette.white05,
                  ],
                ).marginOnly(bottom: 20),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const MyOutfits();
                    },
                  ),
                ).marginOnly(bottom: 20),
                const TextAndIconButton(
                  text: 'Mis Items ',
                  icons: [
                    Icons.add,
                    Icons.arrow_forward_ios,
                  ],
                  iconColors: [
                    Palette.blueBlack,
                    Palette.white05,
                  ],
                ).marginOnly(bottom: 20),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const MyOutfits();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
