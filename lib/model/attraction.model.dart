// To parse this JSON data, do
//
//     final attractionPlace = attractionPlaceFromJson(jsonString);

import 'dart:convert';

AttractionPlace attractionPlaceFromJson(String str) =>
    AttractionPlace.fromJson(json.decode(str));

String attractionPlaceToJson(AttractionPlace data) =>
    json.encode(data.toJson());

class AttractionPlace {
  AttractionPlace({
    this.id,
    this.titleTh,
    this.addressTh,
    this.opentime,
    this.recommened,
    this.source,
    this.addressFull,
    this.verified,
    this.tag,
    this.aboutTh,
    this.type,
    this.rating,
    this.iframe,
    this.googleMapUrl,
    this.googleMapShare,
    this.lat,
    this.long,
    this.contact,
    this.reviews,
    this.addressEn,
    this.titleEn,
  });

  String? id;
  String? titleTh;
  Address? addressTh;
  Opentime? opentime;
  Recommened? recommened;
  String? source;
  String? addressFull;
  bool? verified;
  List<String>? tag;
  String? aboutTh;
  String? type;
  int? rating;
  String? iframe;
  String? googleMapUrl;
  String? googleMapShare;
  double? lat;
  double? long;
  Contact? contact;
  Reviews? reviews;
  Address? addressEn;
  String? titleEn;

  factory AttractionPlace.fromJson(Map<String, dynamic> json) =>
      AttractionPlace(
        id: json["id"],
        titleTh: json["title_th"],
        addressTh: Address.fromJson(json["address_th"]),
        opentime: Opentime.fromJson(json["opentime"]),
        recommened: Recommened.fromJson(json["recommened"]),
        source: json["source"],
        addressFull: json["address_full"],
        verified: json["verified"],
        tag: List<String>.from(json["tag"].map((x) => x)),
        aboutTh: json["about_th"],
        type: json["type"],
        rating: json["rating"],
        iframe: json["iframe"],
        googleMapUrl: json["googleMap_url"],
        googleMapShare: json["googleMap_share"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        contact: Contact.fromJson(json["contact"]),
        reviews: Reviews.fromJson(json["review_page"]),
        addressEn: Address.fromJson(json["address_en"]),
        titleEn: json["title_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_th": titleTh,
        "address_th": addressTh?.toJson(),
        "opentime": opentime?.toJson(),
        "recommened": recommened!.toJson(),
        "source": source,
        "address_full": addressFull,
        "verified": verified,
        "tag": List<dynamic>.from(tag!.map((x) => x)),
        "about_th": aboutTh,
        "type": type,
        "rating": rating,
        "iframe": iframe,
        "googleMap_url": googleMapUrl,
        "googleMap_share": googleMapShare,
        "lat": lat,
        "long": long,
        "contact": contact?.toJson(),
        "review_page": reviews?.toJson(),
        "address_en": addressEn?.toJson(),
        "title_en": titleEn,
      };
}

class Address {
  Address({
    this.subDistrict,
    this.district,
    this.province,
    this.postCode,
  });

  String? subDistrict;
  String? district;
  String? province;
  String? postCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        subDistrict: json["sub_district"],
        district: json["district"],
        province: json["province"],
        postCode: json["post_code"],
      );

  Map<String, dynamic> toJson() => {
        "sub_district": subDistrict,
        "district": district,
        "province": province,
        "post_code": postCode,
      };
}

class Contact {
  Contact({
    this.phone,
    this.email,
    this.social,
    this.website,
  });

  String? phone;
  String? email;
  Social? social;
  String? website;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phone: json["phone"],
        email: json["email"],
        social: Social.fromJson(json["social"]),
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "social": social?.toJson(),
        "website": website,
      };
}

class Social {
  Social({
    this.facebook,
  });

  String? facebook;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        facebook: json["facebook"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
      };
}

class Opentime {
  Opentime({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturay,
    this.sunday,
  });

  Day? monday;
  Day? tuesday;
  Day? wednesday;
  Day? thursday;
  Day? friday;
  Day? saturay;
  Day? sunday;

  factory Opentime.fromJson(Map<String, dynamic> json) => Opentime(
        monday: Day.fromJson(json["monday"]),
        tuesday: Day.fromJson(json["tuesday"]),
        wednesday: Day.fromJson(json["wednesday"]),
        thursday: Day.fromJson(json["thursday"]),
        friday: Day.fromJson(json["friday"]),
        saturay: Day.fromJson(json["saturay"]),
        sunday: Day.fromJson(json["sunday"]),
      );

  Map<String, dynamic> toJson() => {
        "monday": monday?.toJson(),
        "tuesday": tuesday?.toJson(),
        "wednesday": wednesday?.toJson(),
        "thursday": thursday?.toJson(),
        "friday": friday?.toJson(),
        "saturay": saturay?.toJson(),
        "sunday": sunday?.toJson(),
      };
}

class Day {
  Day({
    this.o,
    this.c,
  });

  String? o;
  String? c;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        o: json["o"],
        c: json["c"],
      );

  Map<String, dynamic> toJson() => {
        "o": o,
        "c": c,
      };
}

class Recommened {
  Recommened();

  factory Recommened.fromJson(Map<String, dynamic> json) => Recommened();

  Map<String, dynamic> toJson() => {};
}

class Reviews {
  Reviews({
    this.amountAll,
    this.excellent,
    this.veryGood,
    this.average,
    this.poor,
    this.terrible,
  });

  int? amountAll;
  Average? excellent;
  Average? veryGood;
  Average? average;
  Average? poor;
  Average? terrible;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        amountAll: json["amount_all"],
        excellent: Average.fromJson(json["excellent"]),
        veryGood: Average.fromJson(json["very_good"]),
        average: Average.fromJson(json["average"]),
        poor: Average.fromJson(json["poor"]),
        terrible: Average.fromJson(json["terrible"]),
      );

  Map<String, dynamic> toJson() => {
        "amount_all": amountAll,
        "excellent": excellent?.toJson(),
        "very_good": veryGood?.toJson(),
        "average": average?.toJson(),
        "poor": poor?.toJson(),
        "terrible": terrible?.toJson(),
      };
}

class Average {
  Average({
    this.amount,
    this.lazyUrl,
  });

  int? amount;
  String? lazyUrl;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
        amount: json["amount"],
        lazyUrl: json["lazy_url"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "lazy_url": lazyUrl,
      };
}
