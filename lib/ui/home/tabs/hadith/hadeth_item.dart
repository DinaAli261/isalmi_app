import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_data.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_text_style.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({required this.index, super.key});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width * 0.72,
      height: height * 0.66,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage(AppImages.hadethCardPg),
          fit: BoxFit.fill,
        ),
      ),
      child: (hadeth == null)
          ? Center(child: CircularProgressIndicator(color: AppColors.brown))
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.05,
                horizontal: width * 0.037,
              ),
              child: Column(
                children: [
                  Text(
                    hadeth?.title ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.boldBlack24,
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.boldBlack16,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
    );
  }

  Future<void> loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/Hadith/h${widget.index}.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadeth = Hadeth(content: content, title: title);
    print(title);
    print(content);
    setState(() {});
  }
}
