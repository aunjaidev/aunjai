import 'package:aunjai/utils/app_theme.dart';
import 'package:flutter/material.dart';

Decoration decoration({Color? color, borderRadius}) => BoxDecoration(
        color: color ?? AppTheme.primary1,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        border: Border.all(
          color: Colors.transparent,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 2.5,
            color: Colors.grey,
            spreadRadius: -2,
          )
        ]);
