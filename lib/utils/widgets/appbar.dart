import 'package:aunjai/constant/color_constant.dart';
import 'package:flutter/material.dart';

AppBar appBar(context,
    {String? title, Widget? titleWidget, List<Widget>? actions,Widget ?leading,Color? backBtnColor,Color ?backgroundColor}) {
  return AppBar(
    elevation: 0.5,
    backgroundColor: backgroundColor??primary3,
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
      icon:  Icon(
        Icons.arrow_back_ios,
        color: backBtnColor??Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
