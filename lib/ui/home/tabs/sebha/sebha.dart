import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_text_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();

}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  List<String> sebhaText = ['الله اكبر', 'سبحان الله', 'الحمدلله',];
  int indexSebhaText = 0;
  late AnimationController controller;
  late Animation<double> rotationAnimation;
  int turns = 0;
  final int turnsCount = 34;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    rotationAnimation = Tween<double>(begin: 0, end: 0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (turns == 0) {
      indexSebhaText += 1;
      if (indexSebhaText == 3) {
        indexSebhaText = 0;
      }
    }
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.017),
      child: Column(
        children: [
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى', style: AppTextStyle.boldWhite36),
          SizedBox(height: height * 0.017,),
          Image.asset(AppImages.sebha2),
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    turns = (turns + 1) % turnsCount;
                    double angle = 2 * pi / turnsCount;
                    rotationAnimation = Tween<double>(
                      begin: rotationAnimation.value,
                      end: turns * angle,).animate(controller);
                  });
                  controller.forward(from: 0);
                },
                child: AnimatedBuilder(
                  animation: rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(angle: rotationAnimation.value,
                      child: Image.asset(AppImages.sebha1),
                    );
                  },

                ),
              ),

              Column(
                children: [
                  Text('$turns', style: AppTextStyle.boldWhite36),
                  Text(sebhaText[indexSebhaText],
                      style: AppTextStyle.boldWhite36)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
