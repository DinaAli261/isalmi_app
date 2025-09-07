import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_text_style.dart';

class SuraShape extends StatefulWidget {
  int shapeNumber;
  List<String> verses;

  SuraShape({required this.shapeNumber, required this.verses, super.key});

  @override
  State<SuraShape> createState() => _SuraShapeState();
}

class _SuraShapeState extends State<SuraShape> {
  int selectedIndex = -1;
  bool colored = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return (widget.shapeNumber == 1)
        ? SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Text(
                widget.verses.join(),
                style: AppTextStyle.boldPrimary20,
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: ListView.separated(
              itemCount: widget.verses.length,
              itemBuilder: (context, index) {
                final colored = selectedIndex == index;
                return InkWell(
                  onTap: () {
                    selectedIndex = (colored) ? -1 : index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(height * 0.022),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: (colored)
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: BoxBorder.all(color: AppColors.primaryColor),
                    ),
                    child: Text(
                      widget.verses[index],
                      style: (colored)
                          ? AppTextStyle.boldBlack20
                          : AppTextStyle.boldPrimary20,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.008),
            ),
          );
  }
}
