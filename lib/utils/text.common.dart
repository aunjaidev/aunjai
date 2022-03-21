import 'package:aunjai/utils/app_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextCommon {

  TextCommon._();

  static Widget buttonTextWidget(text) => AutoSizeText(
    text,
    style: const TextStyle(
      // h5 -> headline
      fontFamily: 'THSarabunNew',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.25,
      letterSpacing: 0.1,
      color: Colors.white,
    ),
  );

  static Widget textActivitiesTitle(text) => AutoSizeText(
    text,
    style: const TextStyle(
      // h5 -> headline
      fontFamily: 'THSarabunNew',
      fontWeight: FontWeight.w500,
      fontSize: 17.5,
      height: 1.25,
      letterSpacing: 0.1,
      color: AppTheme.primary2,
    ),
  );

  static Widget textActivitiesContent(text) => AutoSizeText(
    text,
    style: const TextStyle(
      // h5 -> headline
      fontFamily: 'THSarabunNew',
      fontWeight: FontWeight.w100,
      fontSize: 14,
      height: 1.05,
      letterSpacing: 0.1,
      color: AppTheme.primary2,
    ),
  );

  static Widget normalText(text,
      {double? fontSize, Color? color, TextAlign? align,FontWeight? fontWeight}) =>
      AutoSizeText(
        text,
        maxFontSize: fontSize ?? 16,
        maxLines: 2,
        textAlign: align ?? TextAlign.start,
        style: TextStyle(
          // h5 -> headline
          fontFamily: 'THSarabunNew',
          fontWeight: fontWeight??FontWeight.w100,
          fontSize: fontSize ?? 16,
          height: 1.25,
          letterSpacing: 0.1,
          color: color ?? AppTheme.primary2,
        ),
      );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: 'THSarabunNew',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: -0.04,
    color: AppTheme.primary2,
  );

  static TextStyle customeStyle(
      {FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        double? height}) =>
      TextStyle(
        fontFamily: 'THSarabunNew',
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 18,
        letterSpacing: -0.05,
        height: height,
        color: color ?? AppTheme.primary2,
      );



  static Widget contentHeader(label, {Color? color}) => AutoSizeText(
    label,
    style: TextStyle(
        color: color ?? AppTheme.primary2,
        fontFamily: "THSarabunNew",
        fontSize: 22.0,
        fontWeight: FontWeight.w400),
  );

  static Widget normalContentText(label, {Color? color}) => AutoSizeText(
    label,
    style: TextStyle(
        color: color ?? AppTheme.primary2,
        fontFamily: "THSarabunNew",
        fontSize: 18.0,
        fontWeight: FontWeight.w100),
  );

}