import 'package:cat_trivia/resources/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppTypography {
  //Header
  static const header1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    fontFamily: AppFonts.manropeBold,
    letterSpacing: 0.3,
  );
  static const header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: AppFonts.manropeBold,
    letterSpacing: 0.2,
  );
  static const header3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.manropeBold,
    letterSpacing: 0.2,
  );

  //Header
  static const buttonRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.manropeRegular,
    letterSpacing: 0.1,
  );
  static const buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.manropeRegular,
  );

  //Body
  static const bodyRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.manropeRegular,
  );
  static const bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.manropeBold,
  );
  static const bodyRegularS = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.manropeRegular,
  );
  static const bodyBoldS = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.manropeBold,
  );

  //Label
  static const labelRegular = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.manropeRegular,
      letterSpacing: 1);
  static const labelRegularButtonRed = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.manropeRegular,
      letterSpacing: 1);
  static const labelRegular16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.manropeRegular,
      letterSpacing: 1);

  static const labelBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.manropeBold,
  );

  //Navigation
  static const navigation = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.manropeRegular,
    letterSpacing: 0.4,
  );

  //Message
  static const message = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.manropeRegular,
  );
}
