class ProductModel {
  final String title;
  final String description;
  final String price;
  final List<dynamic> images;

  ProductModel(this.title, this.description, this.price, this.images);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        json["title"], json["description"], json["price"].toString(), json["images"]);
  }

  Map<String, dynamic> toJson() =>
      {"title": title, "description": description, "price": price, "images": images};
}
