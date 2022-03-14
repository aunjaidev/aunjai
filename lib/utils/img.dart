import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

ase64ConvertImage(String img) =>
    Image.memory(const Base64Decoder().convert(img), fit: BoxFit.contain);

getSvgPicture(String path, {width}) => SvgPicture.asset(
      path,
      fit: BoxFit.contain,
      width: width,
    );

getPngPicture(String path, {width}) => Image.asset(
      path,
      width: width,
    );
