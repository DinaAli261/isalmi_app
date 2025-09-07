import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_data.dart';
import 'package:islami_app/ui/home/tabs/quran/sura%20details/widget/sura_shape.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_text_style.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  int shapeNumber = 1;
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      readSuraFile(index + 1);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackPg,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          QuranData.englishQuranSuras[index],
          style: AppTextStyle.boldPrimary20,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              shapeNumber = (shapeNumber == 1) ? 2 : 1;
              setState(() {});
            },
            icon: Icon(Icons.change_circle, color: AppColors.primaryColor),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blackPg,
          image: DecorationImage(
            image: AssetImage(AppImages.suraDetailPg),
            fit: BoxFit.fill,
          ),
        ),
        child: (verses.isEmpty)
            ? Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              )
            : Column(
                children: [
                  SizedBox(height: height * 0.018),
                  Text(
                    QuranData.arabicQuranSuras[index],
                    style: AppTextStyle.boldPrimary24,
                  ),
                  SizedBox(height: height * 0.05),
                  Expanded(
                    child: SuraShape(shapeNumber: shapeNumber, verses: verses),
                  ),
                  Container(height: height * 0.12),
                ],
              ),
      ),
    );
  }

  Future<void> readSuraFile(int i) async {
    String sura = await rootBundle.loadString('assets/files/quran/$i.txt');
    verses = (sura.split('\n'));
    for (int j = 0; j < verses.length; j++) {
      verses[j] += '[${j + 1}] ';
    }
    setState(() {});
  }
}
