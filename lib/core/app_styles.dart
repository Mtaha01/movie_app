import 'package:flutter/material.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:google_fonts/google_fonts.dart';
class AppStyles{
  static  TextStyle mediumTitles=GoogleFonts.inter(
    color: ColorsManager.white,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static  TextStyle smallText=GoogleFonts.inter(
    color: ColorsManager.white,
    fontWeight: FontWeight.w400,
    fontSize: 8,
  );
  static  TextStyle largeText=GoogleFonts.inter(
    color: ColorsManager.white,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );


}