class ProductModel {
  final int price;
  final String name;
  final String categoryId;
  final String subName;
  final String description;
  final String avatarId;

  ProductModel({
    required this.price,
    required this.name,
    required this.categoryId,
    required this.subName,
    required this.description,
    required this.avatarId,
  });

  ProductModel copyWith({
    int? price,
    String? name,
    String? categoryId,
    String? subName,
    String? description,
    String? avatarId,
  }) =>
      ProductModel(
        price: price ?? this.price,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        subName: subName ?? this.subName,
        description: description ?? this.description,
        avatarId: avatarId ?? this.avatarId,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        price: json["price"],
        name: json["name"],
        categoryId: json["categoryId"],
        subName: json["subName"],
        description: json["description"],
        avatarId: json["avatarId"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "categoryId": categoryId,
        "subName": subName,
        "description": description,
        "avatarId": avatarId,
      };
}
