import 'package:virtustyler/core/models/product_model.dart';
import 'package:virtustyler/core/Util/const.dart';
import 'package:virtustyler/core/Util/util.dart';

class AssetModel {
  final String name;
  final CategoryType type;
  final String bodyType;
  final String gender;
  final bool locked;
  final String modelUrl;
  final String iconUrl;
  final String organizationId;
  final ModelVersions modelVersions;
  final String id;
  final bool editable;
  final bool hasApps;
  final List<dynamic> campaignIds;
  final List<dynamic> faceBlendShapes;
  final String hairStyle;
  final String eyebrowStyle;
  final String eyeStyle;
  final String beardStyle;
  final String glassesStyle;
  final List<dynamic> lockedCategories;
  final bool iconGlow;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductModel? productModel;

  AssetModel({
    required this.name,
    required this.type,
    required this.bodyType,
    required this.gender,
    required this.locked,
    required this.modelUrl,
    required this.iconUrl,
    required this.organizationId,
    required this.modelVersions,
    required this.id,
    required this.editable,
    required this.hasApps,
    required this.campaignIds,
    required this.faceBlendShapes,
    required this.hairStyle,
    required this.eyebrowStyle,
    required this.eyeStyle,
    required this.beardStyle,
    required this.glassesStyle,
    required this.lockedCategories,
    required this.iconGlow,
    required this.createdAt,
    required this.updatedAt,
    this.productModel,
  });

  AssetModel copyWith({
    String? name,
    CategoryType? type,
    String? bodyType,
    String? gender,
    bool? locked,
    String? modelUrl,
    String? iconUrl,
    String? organizationId,
    ModelVersions? modelVersions,
    String? id,
    bool? editable,
    bool? hasApps,
    List<dynamic>? campaignIds,
    List<dynamic>? faceBlendShapes,
    String? hairStyle,
    String? eyebrowStyle,
    String? eyeStyle,
    String? beardStyle,
    String? glassesStyle,
    List<dynamic>? lockedCategories,
    bool? iconGlow,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProductModel? productModel,
  }) =>
      AssetModel(
        productModel: productModel ?? this.productModel,
        name: name ?? this.name,
        type: type ?? this.type,
        bodyType: bodyType ?? this.bodyType,
        gender: gender ?? this.gender,
        locked: locked ?? this.locked,
        modelUrl: modelUrl ?? this.modelUrl,
        iconUrl: iconUrl ?? this.iconUrl,
        organizationId: organizationId ?? this.organizationId,
        modelVersions: modelVersions ?? this.modelVersions,
        id: id ?? this.id,
        editable: editable ?? this.editable,
        hasApps: hasApps ?? this.hasApps,
        campaignIds: campaignIds ?? this.campaignIds,
        faceBlendShapes: faceBlendShapes ?? this.faceBlendShapes,
        hairStyle: hairStyle ?? this.hairStyle,
        eyebrowStyle: eyebrowStyle ?? this.eyebrowStyle,
        eyeStyle: eyeStyle ?? this.eyeStyle,
        beardStyle: beardStyle ?? this.beardStyle,
        glassesStyle: glassesStyle ?? this.glassesStyle,
        lockedCategories: lockedCategories ?? this.lockedCategories,
        iconGlow: iconGlow ?? this.iconGlow,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        name: json["name"],
        type: Util.categoryToEnum(json["type"]),
        bodyType: json["bodyType"],
        gender: json["gender"],
        locked: json["locked"],
        modelUrl: json["modelUrl"],
        iconUrl: json["iconUrl"],
        organizationId: json["organizationId"],
        modelVersions: ModelVersions.fromJson(json["modelVersions"]),
        id: json["id"],
        editable: json["editable"],
        hasApps: json["hasApps"],
        campaignIds: List<dynamic>.from(json["campaignIds"].map((x) => x)),
        faceBlendShapes:
            List<dynamic>.from(json["faceBlendShapes"].map((x) => x)),
        hairStyle: json["hairStyle"],
        eyebrowStyle: json["eyebrowStyle"],
        eyeStyle: json["eyeStyle"],
        beardStyle: json["beardStyle"],
        glassesStyle: json["glassesStyle"],
        lockedCategories:
            List<dynamic>.from(json["lockedCategories"].map((x) => x)),
        iconGlow: json["iconGlow"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": Util.categoryToString(type),
        "bodyType": bodyType,
        "gender": gender,
        "locked": locked,
        "modelUrl": modelUrl,
        "iconUrl": iconUrl,
        "organizationId": organizationId,
        "modelVersions": modelVersions.toJson(),
        "id": id,
        "editable": editable,
        "hasApps": hasApps,
        "campaignIds": List<dynamic>.from(campaignIds.map((x) => x)),
        "faceBlendShapes": List<dynamic>.from(faceBlendShapes.map((x) => x)),
        "hairStyle": hairStyle,
        "eyebrowStyle": eyebrowStyle,
        "eyeStyle": eyeStyle,
        "beardStyle": beardStyle,
        "glassesStyle": glassesStyle,
        "lockedCategories": List<dynamic>.from(lockedCategories.map((x) => x)),
        "iconGlow": iconGlow,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ModelVersions {
  final String maleAthletic;
  final String maleHeavyset;
  final String malePlussize;
  final String femaleAthletic;
  final String femaleHeavyset;
  final String femalePlussize;

  ModelVersions({
    required this.maleAthletic,
    required this.maleHeavyset,
    required this.malePlussize,
    required this.femaleAthletic,
    required this.femaleHeavyset,
    required this.femalePlussize,
  });

  ModelVersions copyWith({
    String? maleAthletic,
    String? maleHeavyset,
    String? malePlussize,
    String? femaleAthletic,
    String? femaleHeavyset,
    String? femalePlussize,
  }) =>
      ModelVersions(
        maleAthletic: maleAthletic ?? this.maleAthletic,
        maleHeavyset: maleHeavyset ?? this.maleHeavyset,
        malePlussize: malePlussize ?? this.malePlussize,
        femaleAthletic: femaleAthletic ?? this.femaleAthletic,
        femaleHeavyset: femaleHeavyset ?? this.femaleHeavyset,
        femalePlussize: femalePlussize ?? this.femalePlussize,
      );

  factory ModelVersions.fromJson(Map<String, dynamic> json) => ModelVersions(
        maleAthletic: json["male_athletic"],
        maleHeavyset: json["male_heavyset"],
        malePlussize: json["male_plussize"],
        femaleAthletic: json["female_athletic"],
        femaleHeavyset: json["female_heavyset"],
        femalePlussize: json["female_plussize"],
      );

  Map<String, dynamic> toJson() => {
        "male_athletic": maleAthletic,
        "male_heavyset": maleHeavyset,
        "male_plussize": malePlussize,
        "female_athletic": femaleAthletic,
        "female_heavyset": femaleHeavyset,
        "female_plussize": femalePlussize,
      };
}
