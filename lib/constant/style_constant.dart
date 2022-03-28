import 'package:aunjai/constant/color_constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


Widget buttonTextWidget(text) => AutoSizeText(
      text,
      style: const TextStyle(
// h5 -> headline

        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.25,
        letterSpacing: 0.1,
        color: Colors.white,
      ),
    );

Widget textContentTitle(text) => AutoSizeText(
      text,
      style: const TextStyle(
// h5 -> headline

        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 1.25,
        letterSpacing: 0.1,
        color: primary2,
      ),
    );

Widget textActivitiesContent(text) => AutoSizeText(
      text,
      style: const TextStyle(
// h5 -> headline

        fontWeight: FontWeight.w100,
        fontSize: 14,
        height: 1.05,
        letterSpacing: 0.1,
        color: primary2,
      ),
    );

Widget normalText(text,
        {double? fontSize,
        Color? color,
        TextAlign? align,
        FontWeight? fontWeight,
        int? maxLines}) =>
    AutoSizeText(
      text,
      maxFontSize: fontSize ?? 16,
      maxLines: maxLines ?? 2,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
// h5 -> headline
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 16,
        height: 1.25,
        letterSpacing: 0.1,
        color: color ?? primary2,
      ),
    );

Widget subtitle(text, {Color? color,double ?fontSize}) => AutoSizeText(
      text,
      style: TextStyle(
// subtitle2 -> subtitle

        fontWeight: FontWeight.w500,
        fontSize: fontSize??14,
        letterSpacing: -0.04,
        color: color ?? primary3,
      ),
    );

TextStyle customStyle(
        {FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        double? height}) =>
    TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? 18,
      letterSpacing: -0.05,
      height: height,
      color: color ?? primary2,
    );

Widget normalContentText(label, {Color? color}) => AutoSizeText(
      label,
      style: TextStyle(
          color: color ?? primary2,
          fontFamily: "THSarabunNew",
          fontSize: 18.0,
          fontWeight: FontWeight.w100),
    );

titleActivities(text) => AutoSizeText(
      text,
      style: const TextStyle(
        // subtitle2 -> subtitle

        fontWeight: FontWeight.w500,
        fontSize: 26,
        letterSpacing: -0.04,
        color: primary2,
      ),
    );
