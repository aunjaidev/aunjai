import 'package:flutter/material.dart';
import 'dart:convert';

MentionModel mentionModelFromJson(String str) =>
    MentionModel.fromJson(json.decode(str));

class MentionModel {
  MentionModel({
    required this.id,
    required this.type,
    required this.labelTh,
    required this.labelEn,
  });

  final String id;
  final String type;
  final String labelTh;
  final String labelEn;

  factory MentionModel.fromJson(Map<String, dynamic> json) => MentionModel(
        id: json["id"],
        type: json["type"],
        labelTh: json["label_th"],
        labelEn: json["label_en"],
      );
}
