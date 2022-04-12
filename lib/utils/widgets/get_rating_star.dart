import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ratingStar({double? size, required double score}) {
  List<Widget> widgets = [];
  for (int i = 0; i < score.toInt(); i++) {
    widgets.add(Icon(
      Icons.star,
      size: size ?? 18.0,
      color: primary2,
    ));
  }

  if (score.toInt() != score) {
    widgets.add(Icon(
      Icons.star_half,
      size: size ?? 18.0,
      color: primary2,
    ));
  }

  for (int i = 0; i < 5 - widgets.length; i++) {
    widgets.add(Icon(
      Icons.star_border_outlined,
      size: size ?? 18.0,
      color: primary2,
    ));
  }
  return Row(
    children: widgets,
  );
}