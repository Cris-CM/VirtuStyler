class UserModel {
  final String? id;
  final String uid;
  final String name;
  final String? avatarId;
  final bool isAdmin;

  UserModel({
    this.id,
    required this.uid,
    required this.name,
    required this.isAdmin,
    this.avatarId,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? name,
    String? avatarId,
    bool? isAdmin,
  }) =>
      UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        avatarId: avatarId ?? this.avatarId,
        isAdmin: isAdmin ?? this.isAdmin,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        avatarId: json["avatarId"],
        isAdmin: json["isAdmin"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "avatarId": avatarId,
        "isAdmin":isAdmin,
      };
}
