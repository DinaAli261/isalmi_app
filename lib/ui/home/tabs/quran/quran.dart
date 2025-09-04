import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_text_style.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        TextField(
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            hintText: 'Sura Name',
            hintStyle: AppTextStyle.boldWhite16,
            prefixIcon: ImageIcon(
              AssetImage(AppImages.iconQuran),
              color: AppColors.primaryColor,
            ),
            enabledBorder: createBorderStyle(),
            focusedBorder: createBorderStyle(),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text('Most Recently', style: AppTextStyle.boldWhite16),
        SizedBox(height: height * 0.008),
        SizedBox(
          width: double.infinity,
          height: height * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                  left: width * 0.03,
                  top: 0.007 * height,
                  bottom: 0.007 * height,
                  right: width * 0.02,
                ),
                width: width * 0.65,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Al-Anbiya', style: AppTextStyle.boldBlack24),
                          Text('الأنبياء', style: AppTextStyle.boldBlack24),
                          Text('112 Verses', style: AppTextStyle.boldBlack14),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Image.asset(AppImages.quranListImage),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: width * 0.02),
            itemCount: 20,
          ),
        ),
        SizedBox(height: height * 0.01),
        Text('Suras List', style: AppTextStyle.boldWhite16),
        SizedBox(height: height * 0.01),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SuraItem(index: index);
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              indent: 0.1 * width,
              endIndent: 0.09 * width,
            ),
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder createBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
  );
}
