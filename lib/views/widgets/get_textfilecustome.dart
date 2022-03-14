import 'package:flutter/material.dart';
import 'package:aunjai/app_theme.dart';
import 'package:aunjai/init.dart';
import 'package:aunjai/utils/media_size.dart';

Widget getTextFieldCustome(context, {String? label}) {
  return SizedBox(
    width: Helper.getScreenWidth(context),
    height: 64,
    child: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#f1f2f3'),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(13.0),
            bottomLeft: Radius.circular(13.0),
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(13.0),
          ),
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
                  style: const TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppTheme.darkGrey,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: label ?? "",
                    border: InputBorder.none,
                    helperStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFB9BABC),
                    ),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: Color(0xFFB9BABC),
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
