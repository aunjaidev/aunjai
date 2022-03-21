import 'package:aunjai/utils/app_theme.dart';
import 'package:flutter/material.dart';

Widget ratingStar({double? size, required double score}) {
  List<Widget> widgets = [];
  for (int i = 0; i < score.toInt(); i++) {
    widgets.add(Icon(
      Icons.star,
      size: size ?? 18.0,
      color: AppTheme.primary1,
    ));
  }

  if (score.toInt() != score) {
    widgets.add(Icon(
      Icons.star_half,
      size: size ?? 18.0,
      color: AppTheme.primary1,
    ));
  }

  for (int i = 0; i < 5 - widgets.length; i++) {
    widgets.add(Icon(
      Icons.star_border,
      size: size ?? 18.0,
      color: AppTheme.primary1,
    ));
  }
  return Row(
    children: widgets,
  );
}