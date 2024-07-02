class UserModel {
  final String? id;
  final String uid;
  final String name;
  final String? avatarId;

  UserModel({
      this.id,
    required this.uid,
    required this.name,
      this.avatarId,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? name,
    String? avatarId,
  }) =>
      UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        avatarId: avatarId ?? this.avatarId,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        avatarId: json["avatarId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "avatarId": avatarId,
      };
}
