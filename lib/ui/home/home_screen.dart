import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> bgImage = [
    AppImages.quranbg,
    AppImages.hadethbg,
    AppImages.sebhabg,
    AppImages.radiobg,
    AppImages.timebg
  ];
  static int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(bgImage[selectedIndex], width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImages.headerImage),
              Expanded(child: Container(
                color: AppColors.white,
              ))
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            createItem('Quran', selectedIndex, 0),
            createItem('Hadith', selectedIndex, 1),
            createItem('Sebha', selectedIndex, 2),
            createItem('Radio', selectedIndex, 3),
            createItem('Time', selectedIndex, 4),
          ]),
    );
  }
}


BottomNavigationBarItem createItem(String name, int selected, int index) {
  List<dynamic> images = [
    AppImages.iconQuran,
    AppImages.iconhadeth,
    AppImages.iconsebha,
    AppImages.iconradio,
    AppImages.icontime
  ];
  return BottomNavigationBarItem(icon: (selected == index) ? Container(
      width: 59, height: 34,
      decoration: BoxDecoration(
          color: AppColors.blackPg,
          borderRadius: BorderRadius.circular(66)
      ),
      child: ImageIcon(AssetImage(images[index]))) : ImageIcon(
      AssetImage(images[index])), label: name);
}