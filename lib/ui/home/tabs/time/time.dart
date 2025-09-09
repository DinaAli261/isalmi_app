import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_text_style.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  int selectedIndex = 0;
  bool isFocused = false;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: width * 0.9,
          height: height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.prayTime), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(40),
              color: AppColors.brown
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('16 Jul,\n2024 ', style: AppTextStyle.boldWhite16,),
                  Column(
                    children: [
                      Text('Pray Time', style: AppTextStyle.boldBlack7120,),
                      Text('Tuesday', style: AppTextStyle.boldBlack9020),
                    ],
                  ),
                  Text('09 Muh,\n    1446', style: AppTextStyle.boldWhite16,),
                ],
              ),


              Row(
                children: [
                  Container(
                    width: (isFocused) ? width * 0.24 : width * 0.2,
                    height: (isFocused) ? height * 0.13 : height * 0.11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [AppColors.black, AppColors.primaryGardient,],
                          begin: AlignmentGeometry.topLeft,
                          end: AlignmentGeometry.centerRight),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('ASR', style: (isFocused)
                            ? AppTextStyle.boldWhite16
                            : AppTextStyle.boldWhite14,),
                        Text('04:38', style: (isFocused)
                            ? AppTextStyle.boldWhite32
                            : AppTextStyle.boldWhite20,),
                        Text('PM', style: (isFocused)
                            ? AppTextStyle.boldWhite16
                            : AppTextStyle.boldWhite14,),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: width * 0.22,),
                  Text('Next Pray', style: AppTextStyle.boldBlack7116,),
                  Text('- 02:32', style: AppTextStyle.boldBlack9016,),
                  SizedBox(width: width * 0.16,),
                  Icon(Icons.volume_off_rounded)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
