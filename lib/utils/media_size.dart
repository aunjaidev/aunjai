import 'package:flutter/material.dart';


class Helper {
  static const kDefaultPadding = 20.0;
  static const kBorderRadiusButton = 8.0;

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
