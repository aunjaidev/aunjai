import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF4CAD73);
  // static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFFFFFF);
  static const Color nearlyGrey = Color(0xFFF4F4F4);
  static const Color nearlyBlack = Color(0xFF213333);
  // static const Color grey = Color(0xFFF1F2F3);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  // static const Color deactivatedText = Color(0xFF767676);
  // static const Color dismissibleBackground = Color(0xFF364A54);
  // static const Color chipBackground = Color(0xFFEEF1F3);
  // static const Color spacer = Color(0xFFF2F2F2);
  static const double layoutPadding = 20.0;

  static Widget textActivitiesTitle(text) => AutoSizeText(
        text,
        style: const TextStyle(
          // h5 -> headline
          fontFamily: 'Mitr',
          fontWeight: FontWeight.w500,
          fontSize: 17.5,
          height: 1.25,
          letterSpacing: 0.1,
          color: darkerText,
        ),
      );

  static Widget textActivitiesContent(text) => AutoSizeText(
        text,
        style: const TextStyle(
          // h5 -> headline
          fontFamily: 'Mitr',
          fontWeight: FontWeight.w100,
          fontSize: 14,
          height: 1.05,
          letterSpacing: 0.1,
          color: darkerText,
        ),
      );

  static Widget normalText(text, {double? fontSize, Color? color}) =>
      AutoSizeText(
        text,
        maxFontSize: fontSize ?? 16,
        maxLines: 2,
        style: TextStyle(
          // h5 -> headline
          fontFamily: 'Mitr',
          fontWeight: FontWeight.w100,
          fontSize: fontSize ?? 16,
          height: 1.05,
          letterSpacing: 0.1,
          color: color ?? darkerText,
        ),
      );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: 'Mitr',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static TextStyle customeStyle(
          {FontWeight? fontWeight,
          double? fontSize,
          Color? color,
          double? height}) =>
      TextStyle(
        fontFamily: 'Mitr',
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 18,
        letterSpacing: -0.05,
        height: height,
        color: color ?? darkText,
      );

  static TextStyle normalStyle({double? fontSize, Color? color}) => TextStyle(
      fontFamily: "Mitr",
      color: color ?? AppTheme.darkText,
      fontSize: fontSize ?? 14.0,
      fontWeight: FontWeight.w400);

  static Widget titleHeader(label, {Color? color}) => AutoSizeText(
        label,
        style: TextStyle(
            color: color ?? AppTheme.nearlyBlack,
            fontFamily: "Mitr",
            fontSize: 30.0,
            fontWeight: FontWeight.w500),
      );

  static Decoration getDecoration({Color? color, borderRadius}) =>
      BoxDecoration(
          color: color ?? AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 2.5,
              color: Colors.grey,
              spreadRadius: -2,
            )
          ]);
}
