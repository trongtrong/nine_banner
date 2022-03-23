// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.id,
    this.code,
    this.name,
    this.banners,
    this.zone,
    this.screen,
  });

  String id;
  String code;
  String name;
  List<BannerItem> banners;
  Screen zone;
  Screen screen;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    banners: List<BannerItem>.from(json["banners"].map((x) => BannerItem.fromJson(x))),
    zone: Screen.fromJson(json["zone"]),
    screen: Screen.fromJson(json["screen"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "zone": zone.toJson(),
    "screen": screen.toJson(),
  };
}

class BannerItem {
  BannerItem({
    this.image,
    this.sort,
    this.startTime,
    this.endTime,
    this.status,
    this.target,
    this.campaign,
    this.segment,
  });

  String image;
  String sort;
  DateTime startTime;
  DateTime endTime;
  String status;
  Target target;
  Campaign campaign;
  List<String> segment;

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
    image: json["image"],
    sort: json["sort"],
    startTime: DateTime.parse(json["start_time"]),
    endTime: DateTime.parse(json["end_time"]),
    status: json["status"],
    target: Target.fromJson(json["target"]),
    campaign: Campaign.fromJson(json["campaign"]),
    segment: List<String>.from(json["segment"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "sort": sort,
    "start_time": startTime.toIso8601String(),
    "end_time": endTime.toIso8601String(),
    "status": status,
    "target": target.toJson(),
    "campaign": campaign.toJson(),
    "segment": List<dynamic>.from(segment.map((x) => x)),
  };
}

class Campaign {
  Campaign({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
  });

  int id;
  String name;
  DateTime startTime;
  DateTime endTime;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
    id: json["id"],
    name: json["name"],
    startTime: DateTime.parse(json["start_time"]),
    endTime: DateTime.parse(json["end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "start_time": startTime.toIso8601String(),
    "end_time": endTime.toIso8601String(),
  };
}

class Target {
  Target({
    this.name,
    this.type,
    this.value,
    this.params,
  });

  String name;
  String type;
  String value;
  Params params;

  factory Target.fromJson(Map<String, dynamic> json) => Target(
    name: json["name"],
    type: json["type"],
    value: json["value"],
    params: Params.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "value": value,
    "params": params.toJson(),
  };
}

class Params {
  Params();

  factory Params.fromJson(Map<String, dynamic> json) => Params(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Screen {
  Screen({
    this.id,
    this.name,
    this.code,
    this.type,
  });

  int id;
  String name;
  String code;
  Type type;

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    type: json["type"] == null ? null : Type.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "type": type == null ? null : type.toJson(),
  };
}

class Type {
  Type({
    this.id,
    this.name,
    this.width,
    this.height,
  });

  int id;
  String name;
  int width;
  int height;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    name: json["name"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "width": width,
    "height": height,
  };
}
