import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_data.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_text_style.dart';

class MostRecentlyWidget extends StatefulWidget {
  const MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.readMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              QuranData.englishQuranSuras[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppTextStyle.boldBlack24,
                            ),
                            Text(
                              QuranData.arabicQuranSuras[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppTextStyle.boldBlack24,
                            ),
                            Text(
                              QuranData.ayaNumber[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppTextStyle.boldBlack14,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Image.asset(AppImages.quranListImage),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.02),
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
