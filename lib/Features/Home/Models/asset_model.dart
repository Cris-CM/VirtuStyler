class AssetModel {
  final String id;
  final String name;
  final String organizationId;
  final bool listed;
  final bool locked;
  final String type;
  final bool editable;
  final String gender;
  final bool hasApps;
  final List<dynamic> campaignIds;
  final String modelUrl;
  final String iconUrl;
  final List<dynamic> faceBlendShapes;
  final List<dynamic> lockedCategories;
  final bool iconGlow;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ModelVersions modelVersions;

  AssetModel({
    required this.id,
    required this.name,
    required this.organizationId,
    required this.listed,
    required this.locked,
    required this.type,
    required this.editable,
    required this.gender,
    required this.hasApps,
    required this.campaignIds,
    required this.modelUrl,
    required this.iconUrl,
    required this.faceBlendShapes,
    required this.lockedCategories,
    required this.iconGlow,
    required this.createdAt,
    required this.updatedAt,
    required this.modelVersions,
  });

  AssetModel copyWith({
    String? id,
    String? name,
    String? organizationId,
    bool? listed,
    bool? locked,
    String? type,
    bool? editable,
    String? gender,
    bool? hasApps,
    List<dynamic>? campaignIds,
    String? modelUrl,
    String? iconUrl,
    List<dynamic>? faceBlendShapes,
    List<dynamic>? lockedCategories,
    bool? iconGlow,
    DateTime? createdAt,
    DateTime? updatedAt,
    ModelVersions? modelVersions,
  }) =>
      AssetModel(
        id: id ?? this.id,
        name: name ?? this.name,
        organizationId: organizationId ?? this.organizationId,
        listed: listed ?? this.listed,
        locked: locked ?? this.locked,
        type: type ?? this.type,
        editable: editable ?? this.editable,
        gender: gender ?? this.gender,
        hasApps: hasApps ?? this.hasApps,
        campaignIds: campaignIds ?? this.campaignIds,
        modelUrl: modelUrl ?? this.modelUrl,
        iconUrl: iconUrl ?? this.iconUrl,
        faceBlendShapes: faceBlendShapes ?? this.faceBlendShapes,
        lockedCategories: lockedCategories ?? this.lockedCategories,
        iconGlow: iconGlow ?? this.iconGlow,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        modelVersions: modelVersions ?? this.modelVersions,
      );

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        id: json["id"],
        name: json["name"],
        organizationId: json["organizationId"],
        listed: json["listed"],
        locked: json["locked"],
        type: json["type"],
        editable: json["editable"],
        gender: json["gender"],
        hasApps: json["hasApps"],
        campaignIds: List<dynamic>.from(json["campaignIds"].map((x) => x)),
        modelUrl: json["modelUrl"],
        iconUrl: json["iconUrl"],
        faceBlendShapes:
            List<dynamic>.from(json["faceBlendShapes"].map((x) => x)),
        lockedCategories:
            List<dynamic>.from(json["lockedCategories"].map((x) => x)),
        iconGlow: json["iconGlow"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        modelVersions: ModelVersions.fromJson(json["modelVersions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "organizationId": organizationId,
        "listed": listed,
        "locked": locked,
        "type": type,
        "editable": editable,
        "gender": gender,
        "hasApps": hasApps,
        "campaignIds": List<dynamic>.from(campaignIds.map((x) => x)),
        "modelUrl": modelUrl,
        "iconUrl": iconUrl,
        "faceBlendShapes": List<dynamic>.from(faceBlendShapes.map((x) => x)),
        "lockedCategories": List<dynamic>.from(lockedCategories.map((x) => x)),
        "iconGlow": iconGlow,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "modelVersions": modelVersions.toJson(),
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
