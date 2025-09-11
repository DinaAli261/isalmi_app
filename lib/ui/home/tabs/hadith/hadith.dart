import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadeth_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(enlargeCenterPage: true, height: hight * 0.66),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadethItem(index: index);
      }).toList(),
    );
  }
}
