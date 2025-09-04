import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTextStyle {
  static final TextStyle boldWhite16 = GoogleFonts.elMessiri(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldBlack24 = GoogleFonts.elMessiri(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldBlack14 = GoogleFonts.elMessiri(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle boldWhite20 = GoogleFonts.elMessiri(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
