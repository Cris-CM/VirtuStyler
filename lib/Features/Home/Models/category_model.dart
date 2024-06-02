class CategoryModel {
  final String id;
  final String name;
  final String? imageId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageId,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageId,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageId: imageId ?? this.imageId,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageId": imageId,
      };
}
