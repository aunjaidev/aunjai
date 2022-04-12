import 'dart:convert';

import 'package:aunjai/utils/widgets/vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Helper {
  static const double layoutPadding = 10.0;
  static  Vertical widgetSpacePadding = const Vertical(5.0);


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

  static Future<BitmapDescriptor>  bitmapDescriptorReadAsset(String path)  {
   return BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(24, 24),
        ),
       path);
  }
}
