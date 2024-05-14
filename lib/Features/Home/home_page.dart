import 'package:easy_padding/easy_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                const CustomText(
                  text: 'Calendario de trajes',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Palette.blueBlack,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Palette.white05,
                      width: 3.5,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 35,
                      color: Palette.white05,
                    ),
                  ),
                ),
              ],
            ).only(bottom: 40),
            Container(
              height: 40.h,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
                        ).only(bottom: 20),
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
                        ).only(bottom: 30),
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
            ),
          ],
        ),
      ),
    );
  }
}
