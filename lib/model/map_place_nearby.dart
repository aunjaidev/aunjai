// To parse this JSON data, do
//
//     final mapPlaceNearby = mapPlaceNearbyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MapPlaceNearby mapPlaceNearbyFromJson(String str) => MapPlaceNearby.fromJson(json.decode(str));

String mapPlaceNearbyToJson(MapPlaceNearby data) => json.encode(data.toJson());

class MapPlaceNearby {
  MapPlaceNearby({
    required this.placeId,
    required this.placeName,
    required this.categoryLabel,
    required this.type,
    required this.rating,
    required this.image,
    required this.lat,
    required this.lon,
  });

  final String placeId;
  final String placeName;
  final String categoryLabel;
  final String type;
  final double rating;
  final String image;
  final double lat;
  final double lon;

  factory MapPlaceNearby.fromJson(Map<String, dynamic> json) => MapPlaceNearby(
    placeId: json["placeId"],
    placeName: json["placeName"],
    categoryLabel: json["categoryLabel"],
    type: json["type"],
    rating: json["rating"].toDouble(),
    image: json["image"],
    lat: json["lat"],
    lon: json["lon"],
  );

  Map<String, dynamic> toJson() => {
    "placeId": placeId,
    "placeName": placeName,
    "categoryLabel": categoryLabel,
    "type": type,
    "rating": rating,
    "image": image,
    "lat": lat,
    "lon": lon,
  };
}
