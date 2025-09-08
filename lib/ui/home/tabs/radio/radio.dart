import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_text_style.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTabs extends StatefulWidget {
  const RadioTabs({super.key});

  @override
  State<RadioTabs> createState() => _RadioTabsState();
}

class _RadioTabsState extends State<RadioTabs> {
  bool isSelected = false;
  int selectedIndex = -1;
  
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
        SizedBox(height: height * 0.02,),
        ToggleSwitch(
          minWidth: width * 0.9,
          cornerRadius: 12.0,
          activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
          activeFgColor: AppColors.black,
          inactiveBgColor: AppColors.blackPg,
          inactiveFgColor: Colors.white,
          initialLabelIndex: 1,
          totalSwitches: 2,
          labels: ['Radio', 'Reciters'],
          radiusStyle: true,
          onToggle: (index) {},
        ),
        SizedBox(height: height * 0.019,),

        ///ملحوظه عايزه اعمل seperated widget
        ///لل item builder
        ///لكن مستنيه الداتا
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return Container(
                  width: width * 0.9,
                  height: height * 0.14,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor
                  ),
                  child: Stack(
                    alignment: AlignmentGeometry.bottomCenter,
                    children: [
                      (isSelected) ? Image.asset(
                        AppImages.radioSoundWave, color: AppColors.black29,)
                          : Image.asset(
                          AppImages.radioMosque, color: AppColors.black29),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Radio Ibrahim Al-Akdar',
                            style: AppTextStyle.boldBlack20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: width * 0.06,),
                              (isSelected) ? InkWell(
                                  onTap: () {
                                    selectedIndex = (isSelected) ? -1 : index;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.pause, size: width * 0.07))
                                  : InkWell(
                                  onTap: () {
                                    selectedIndex = (isSelected) ? -1 : index;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.play_arrow_rounded,
                                    size: width * 0.10,)),
                              (isSelected) ? Stack(
                                alignment: AlignmentGeometry.centerRight,
                                children: [
                                  Icon(Icons.volume_mute_rounded,
                                      size: width * 0.06),
                                  Text('x', style: AppTextStyle.boldBlack12,)
                                ],
                              )
                                  : Icon(
                                  Icons.volume_up_rounded, size: width * 0.06),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.017,),
              itemCount: 5),
        )
      ],
    );
  }
}
