class AnonymousUserModel {
  final DateTime visitedAt;
  final List<dynamic> campaigns;
  final List<dynamic> assets;
  final List<dynamic> wallets;
  final List<String> partners;
  final String id;
  final DateTime deleteAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool isAnonymous;
  final bool isGuest;
  final String anonymousUserModelId;
  final String token;

  AnonymousUserModel({
    required this.visitedAt,
    required this.campaigns,
    required this.assets,
    required this.wallets,
    required this.partners,
    required this.id,
    required this.deleteAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isAnonymous,
    required this.isGuest,
    required this.anonymousUserModelId,
    required this.token,
  });

  AnonymousUserModel copyWith({
    DateTime? visitedAt,
    List<dynamic>? campaigns,
    List<dynamic>? assets,
    List<dynamic>? wallets,
    List<String>? partners,
    String? id,
    DateTime? deleteAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? isAnonymous,
    bool? isGuest,
    String? anonymousUserModelId,
    String? token,
  }) =>
      AnonymousUserModel(
        visitedAt: visitedAt ?? this.visitedAt,
        campaigns: campaigns ?? this.campaigns,
        assets: assets ?? this.assets,
        wallets: wallets ?? this.wallets,
        partners: partners ?? this.partners,
        id: id ?? this.id,
        deleteAt: deleteAt ?? this.deleteAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        isGuest: isGuest ?? this.isGuest,
        anonymousUserModelId: anonymousUserModelId ?? this.anonymousUserModelId,
        token: token ?? this.token,
      );

  factory AnonymousUserModel.fromJson(Map<String, dynamic> json) =>
      AnonymousUserModel(
        visitedAt: DateTime.parse(json["visitedAt"]),
        campaigns: List<dynamic>.from(json["campaigns"].map((x) => x)),
        assets: List<dynamic>.from(json["assets"].map((x) => x)),
        wallets: List<dynamic>.from(json["wallets"].map((x) => x)),
        partners: List<String>.from(json["partners"].map((x) => x)),
        id: json["_id"],
        deleteAt: DateTime.parse(json["deleteAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isAnonymous: json["isAnonymous"],
        isGuest: json["isGuest"],
        anonymousUserModelId: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "visitedAt": visitedAt.toIso8601String(),
        "campaigns": List<dynamic>.from(campaigns.map((x) => x)),
        "assets": List<dynamic>.from(assets.map((x) => x)),
        "wallets": List<dynamic>.from(wallets.map((x) => x)),
        "partners": List<dynamic>.from(partners.map((x) => x)),
        "_id": id,
        "deleteAt": deleteAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "isAnonymous": isAnonymous,
        "isGuest": isGuest,
        "id": anonymousUserModelId,
        "token": token,
      };
}
