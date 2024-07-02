// To parse this JSON data, do
//
//     final avatarTemplateModel = avatarTemplateModelFromJson(jsonString);

import 'dart:convert';

AvatarTemplateModel avatarTemplateModelFromJson(String str) =>
    AvatarTemplateModel.fromJson(json.decode(str));

String avatarTemplateModelToJson(AvatarTemplateModel data) =>
    json.encode(data.toJson());

class AvatarTemplateModel {
  final Assets assets;
  final String bodyType;
  final String partner;
  final String id;
  final String gender;

  AvatarTemplateModel({
    required this.assets,
    required this.bodyType,
    required this.partner,
    required this.id,
    required this.gender,
  });

  AvatarTemplateModel copyWith({
    Assets? assets,
    String? bodyType,
    String? partner,
    String? id,
    String? gender,
  }) =>
      AvatarTemplateModel(
        assets: assets ?? this.assets,
        bodyType: bodyType ?? this.bodyType,
        partner: partner ?? this.partner,
        id: id ?? this.id,
        gender: gender ?? this.gender,
      );

  factory AvatarTemplateModel.fromJson(Map<String, dynamic> json) =>
      AvatarTemplateModel(
        assets: Assets.fromJson(json["assets"]),
        bodyType: json["bodyType"],
        partner: json["partner"],
        id: json["id"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "assets": assets.toJson(),
        "bodyType": bodyType,
        "partner": partner,
        "id": id,
        "gender": gender,
      };
}

class Assets {
  final String skinColorHex;
  final int hairColor;
  final int eyebrowColor;
  final int beardColor;
  final int skinColor;
  final String hairStyle;
  final String beardStyle;
  final String eyeColor;
  final String eyebrowStyle;
  final String glasses;

  Assets({
    required this.skinColorHex,
    required this.hairColor,
    required this.eyebrowColor,
    required this.beardColor,
    required this.skinColor,
    required this.hairStyle,
    required this.beardStyle,
    required this.eyeColor,
    required this.eyebrowStyle,
    required this.glasses,
  });

  Assets copyWith({
    String? skinColorHex,
    int? hairColor,
    int? eyebrowColor,
    int? beardColor,
    int? skinColor,
    String? hairStyle,
    String? beardStyle,
    String? eyeColor,
    String? eyebrowStyle,
    String? glasses,
  }) =>
      Assets(
        skinColorHex: skinColorHex ?? this.skinColorHex,
        hairColor: hairColor ?? this.hairColor,
        eyebrowColor: eyebrowColor ?? this.eyebrowColor,
        beardColor: beardColor ?? this.beardColor,
        skinColor: skinColor ?? this.skinColor,
        hairStyle: hairStyle ?? this.hairStyle,
        beardStyle: beardStyle ?? this.beardStyle,
        eyeColor: eyeColor ?? this.eyeColor,
        eyebrowStyle: eyebrowStyle ?? this.eyebrowStyle,
        glasses: glasses ?? this.glasses,
      );

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        skinColorHex: json["skinColorHex"],
        hairColor: json["hairColor"],
        eyebrowColor: json["eyebrowColor"],
        beardColor: json["beardColor"],
        skinColor: json["skinColor"],
        hairStyle: json["hairStyle"],
        beardStyle: json["beardStyle"],
        eyeColor: json["eyeColor"],
        eyebrowStyle: json["eyebrowStyle"],
        glasses: json["glasses"],
      );

  Map<String, dynamic> toJson() => {
        "skinColorHex": skinColorHex,
        "hairColor": hairColor,
        "eyebrowColor": eyebrowColor,
        "beardColor": beardColor,
        "skinColor": skinColor,
        "hairStyle": hairStyle,
        "beardStyle": beardStyle,
        "eyeColor": eyeColor,
        "eyebrowStyle": eyebrowStyle,
        "glasses": glasses,
      };
}
