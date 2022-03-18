// To parse this JSON data, do
//
//     final reviewPost = reviewPostFromMap(jsonString);

import 'dart:convert';

class ReviewPostModel {
  ReviewPostModel({
    required this.profileImg,
    required this.profileName,
    required this.reviewRating,
    required this.reviewTextPost,
    required this.reviewKeyMention,
    required this.reviewWriteTime,
  });

  String profileImg;
  String profileName;
  double reviewRating;
  String reviewTextPost;
  String reviewKeyMention;
  String reviewWriteTime;

  factory ReviewPostModel.fromJson(String str) => ReviewPostModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewPostModel.fromMap(Map<String, dynamic> json) => ReviewPostModel(
    profileImg: json["profileImg"],
    profileName: json["profileName"],
    reviewRating: json["reviewRating"],
    reviewTextPost: json["reviewTextPost"],
    reviewKeyMention: json["reviewKeyMention"],
    reviewWriteTime: json["reviewWriteTime"],
  );

  Map<String, dynamic> toMap() => {
    "profileImg": profileImg,
    "profileName": profileName,
    "reviewRating": reviewRating,
    "reviewTextPost": reviewTextPost,
    "reviewKeyMention": reviewKeyMention,
    "reviewWriteTime": reviewWriteTime,
  };
}
