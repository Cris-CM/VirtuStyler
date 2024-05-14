import 'package:flutter/material.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            const CustomText(
              text: 'Calendario de trajes',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Palette.black,
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Palette.white,
              ),
              child: Row(
                children: [
                  const Column(
                    children: [
                      CustomText(
                        text: 'Hoy, 1 de enero',
                        fontSize: 22,
                        color: Palette.black,
                      ),
                      CustomText(
                        text: 'Clima',
                        fontSize: 23,
                        color: Palette.whiteOpacity,
                      ),
                      CustomText(
                        text: '-3° a +8°',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Palette.black,
                      ),
                      CustomText(
                        text: 'Probabilidad\nde precipitación',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.whiteOpacity,
                      ),
                      CustomText(
                        text: '90%',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Palette.black,
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/outfit.png')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
