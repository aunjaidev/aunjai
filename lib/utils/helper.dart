import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Helper {
  static const double layoutPadding = 15.0;

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static base64ConvertImage(String img) =>
      Image.memory(const Base64Decoder().convert(img), fit: BoxFit.contain);

  static readSvgPicture(String path, {width}) => SvgPicture.asset(
        path,
        fit: BoxFit.contain,
        width: width,
      );

  static readPngPicture(String path, {width}) => Image.asset(
        path,
        width: width,
      );
}
