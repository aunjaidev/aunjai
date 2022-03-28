import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';

AppBar appBar(context,
    {String? title, Widget? titleWidget, List<Widget>? actions,Widget ?leading,Color ?backColor}) {
  return AppBar(
    backgroundColor: backColor??primary3,
    title: title != null
        ? Text(
            title,
            style: const TextStyle(
                color: primary3,
                fontFamily: "Mitr",
                fontSize: 28.0,
                fontWeight: FontWeight.w400),
          )
        : titleWidget,
    actions: actions ?? [],
    leading: leading ?? IconButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
