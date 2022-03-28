import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:flutter/material.dart';

Widget button(context,
    {required String label, required GestureTapCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
          height: 45,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 225, 225),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          width: Helper.getScreenWidth(context),
          child: Center(
              child: Text(
                label,
                style: customStyle(fontSize: 18.0),
              ))),
    ),
  );
}