class ProductModel {
  final String imageId;
  final int price;
  final String name;
  final String categoryId;
  final String subName;
  final String description;

  ProductModel({
    required this.imageId,
    required this.price,
    required this.name,
    required this.categoryId,
    required this.subName,
    required this.description,
  });

  ProductModel copyWith({
    String? imageId,
    int? price,
    String? name,
    String? categoryId,
    String? subName,
    String? description,
  }) =>
      ProductModel(
        imageId: imageId ?? this.imageId,
        price: price ?? this.price,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        subName: subName ?? this.subName,
        description: description ?? this.description,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        imageId: json["imageId"],
        price: json["price"],
        name: json["name"],
        categoryId: json["categoryId"],
        subName: json["subName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "imageId": imageId,
        "price": price,
        "name": name,
        "categoryId": categoryId,
        "subName": subName,
        "description": description,
      };
}
