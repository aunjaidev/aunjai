import 'package:flutter/material.dart';

Widget progressbar(double value) {
  return LinearProgressIndicator(
    backgroundColor: Colors.black26,
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
    value: value,
  );
}