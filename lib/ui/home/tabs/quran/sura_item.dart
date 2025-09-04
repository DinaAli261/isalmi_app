import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_data.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/app_text_style.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppImages.numberFrame),
            Text('${index + 1}', style: AppTextStyle.boldWhite20),
          ],
        ),
        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranData.englishQuranSuras[index],
              style: AppTextStyle.boldWhite20,
            ),
            Text(
              '${QuranData.ayaNumber[index]} Verses',
              style: AppTextStyle.boldWhite16,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranData.arabicQuranSuras[index],
          style: AppTextStyle.boldWhite20,
        ),
      ],
    );
  }
}
