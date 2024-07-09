import 'package:virtustyler/core/models/product_model.dart';
import 'package:virtustyler/core/Util/const.dart';
import 'package:virtustyler/core/Util/util.dart';

class AssetModel {
  final String name;
  final CategoryType type;
  final String bodyType;
  final String gender;
  final bool locked;
  final String? modelUrl;
  final String iconUrl;
  final String organizationId;

  final String id;

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
    required this.id,
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
    String? id,
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
        id: id ?? this.id,
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
        id: json["id"],
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
        "id": id,
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
