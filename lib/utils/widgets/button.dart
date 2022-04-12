import 'package:aunjai/constant/style_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:flutter/material.dart';

Widget button(context,
    {required String label, required GestureTapCallback onTap,Color ?color,double ?width,Color ?fontColor,Widget ? iconPrefix}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
          height: 45,
          decoration:  BoxDecoration(
              color: color??const Color.fromARGB(255, 225, 225, 225),
              borderRadius: const BorderRadius.all( Radius.circular(10.0))),
          width: width??Helper.getScreenWidth(context),
          child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconPrefix??const SizedBox(),
                  Text(
                    label,
                    style: customStyle(fontSize: 18.0,color: fontColor),
                  ),
                ],
              ))),
    ),
  );
}