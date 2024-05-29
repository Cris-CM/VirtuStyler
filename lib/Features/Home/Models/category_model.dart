class CategoryModel {
  final String name;
  final String? imageId;

  CategoryModel({
    required this.name,
    required this.imageId,
  });

  CategoryModel copyWith({
    String? name,
    String? imageId,
  }) =>
      CategoryModel(
        name: name ?? this.name,
        imageId: imageId ?? this.imageId,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageId": imageId,
      };
}
