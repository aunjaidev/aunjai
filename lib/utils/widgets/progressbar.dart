import 'package:flutter/material.dart';

Widget progressbar(double value) {
  return LinearProgressIndicator(
    minHeight: 10.0,
    backgroundColor: Colors.transparent,
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
    value: value,
  );
}