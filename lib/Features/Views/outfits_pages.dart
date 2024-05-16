import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/colors/palette.dart';
import 'package:virtustyler/core/widgets/custom_texts.dart';
import 'package:virtustyler/core/widgets/my_outfits.dart';

class OutfitsPage extends StatelessWidget {
  const OutfitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const CustomText(
                text: 'Mis trajes',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Palette.blueBlack,
              ).marginOnly(bottom: 30),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Palette.blueBlack,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const CustomText(
                          text: 'All (12)',
                          fontSize: 30,
                          color: Palette.blueBlack,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Palette.whiteGrey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 80.h,
                width: 80.h,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 370,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const MyOutfits();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
