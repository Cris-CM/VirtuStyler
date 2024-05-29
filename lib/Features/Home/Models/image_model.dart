class ImageModel {
  final String url;

  ImageModel({
    required this.url,
  });

  ImageModel copyWith({
    String? url,
  }) =>
      ImageModel(
        url: url ?? this.url,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
