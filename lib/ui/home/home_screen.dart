import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadith.dart';
import 'package:islami_app/ui/home/tabs/quran/quran.dart';
import 'package:islami_app/ui/home/tabs/radio/radio.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha.dart';
import 'package:islami_app/ui/home/tabs/time/time.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTabs(),
    TimeTab()
  ];
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
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(bgImage[selectedIndex], width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, right: width * 0.04, top: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AppImages.headerImage, width: width * 0.69,
                    height: height * 0.15,),
                  Expanded(child: tabs[selectedIndex],
                  )
                ],
              ),
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
      ),
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