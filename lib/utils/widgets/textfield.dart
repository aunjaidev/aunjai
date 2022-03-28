import 'package:aunjai/constant/color_constant.dart';
import 'package:aunjai/utils/helper.dart';
import 'package:flutter/material.dart';

Widget textField(context,
    {String? label, Color? backgroundColor, Color? labelColor}) {
  return SizedBox(
    width: Helper.getScreenWidth(context),
    height: 64,
    child: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     spreadRadius: 1,
          //     blurRadius: 7,
          //     offset: Offset(0, 0), // changes position of shadow
          //   ),
          // ],
          color: backgroundColor ?? Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: Icon(Icons.search, color: Color(0xFFB9BABC)),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: TextFormField(
                  enableSuggestions: true,
                  style: const TextStyle(
                    fontFamily: 'THSarabunNew',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: primary2,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: primary2,
                    hintText: label,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontFamily: "THSarabunNew",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: labelColor ?? primary3,
                    ),
                  ),
                  onEditingComplete: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
