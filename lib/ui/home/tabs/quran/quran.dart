import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_data.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/most_recently_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/sura_item.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_text_style.dart';
import 'package:islami_app/utils/shared_prefs_helper.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filteredList = List.generate(114, (index) => index,);

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        TextField(
          onChanged: (newText) {
            searchByNewText(newText);
          },
          style: AppTextStyle.boldWhite16,
          cursorColor: AppColors.primaryColor,
          style: AppTextStyle.boldWhite16,
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
        MostRecentlyWidget(),
        SizedBox(height: height * 0.01),
        Text('Suras List', style: AppTextStyle.boldWhite16),
        SizedBox(height: height * 0.01),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filteredList[index]);
                    Navigator.of(context).pushNamed(
                        arguments: filteredList[index],
                        AppRoutes.suraDetailsName);
                  },
                  child: SuraItem(index: filteredList[index]));
            },
            separatorBuilder: (context, index) =>
                Divider(
                  thickness: 1,
                  indent: 0.1 * width,
                  endIndent: 0.09 * width,
                ),
            itemCount: filteredList.length,
          ),
        ),
      ],
    );
  }

  void searchByNewText(String newText) {
    List<int> searchResultList = [];
    for (int i = 0; i < 114; i++) {
      if (QuranData.englishQuranSuras[i].toLowerCase().contains(
          newText.toLowerCase())) {
        searchResultList.add(i);
      }
      if (QuranData.arabicQuranSuras[i].toLowerCase().contains(
          newText.toLowerCase())) {
        searchResultList.add(i);
      }
    }
    filteredList = searchResultList;
    setState(() {

    });
  }
}

OutlineInputBorder createBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
  );
}
