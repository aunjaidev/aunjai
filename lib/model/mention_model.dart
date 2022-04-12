// To parse this JSON data, do
//
//     final mentionModel = mentionModelFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

MentionModel mentionModelFromJson(String str) =>
    MentionModel.fromJson(json.decode(str));

String mentionModelToJson(MentionModel data) => json.encode(data.toJson());

class MentionModel {
  MentionModel({
    required this.id,
    required this.type,
    required this.labelTh,
    required this.labelEn,
    this.onTap,
  });

  final String id;
  final String type;
  final String labelTh;
  final String labelEn;
  GestureTapCallback? onTap;

  factory MentionModel.fromJson(Map<String, dynamic> json) => MentionModel(
        id: json["id"],
        type: json["type"],
        labelTh: json["label_th"],
        labelEn: json["label_en"],
      );
}
