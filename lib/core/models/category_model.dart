import 'package:virtustyler/core/Util/const.dart';
import 'package:virtustyler/core/Util/util.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? imageId;
  final CategoryType tag;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageId,
    required this.tag,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageId,
    CategoryType? tag,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageId: imageId ?? this.imageId,
        tag: tag ?? this.tag,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        imageId: json["imageId"],
        tag: Util.categoryToEnum(json["tag"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageId": imageId,
        "tag": Util.categoryToString(tag),
      };
}
