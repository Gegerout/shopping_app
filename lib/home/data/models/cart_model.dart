class CartModel {
  final String title;
  final String price;
  final String image;
  final int count;

  CartModel(this.title, this.price, this.image, this.count);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(json["title"], json["price"], json["image"], json["count"]);
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "image": image,
    "count": count
  };
}