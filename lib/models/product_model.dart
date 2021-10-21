// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

class Products {
  Products({
    required this.available,
    this.image,
    required this.name,
    required this.price,
    this.id,
  });

  bool available;
  String? image;
  String name;
  double price;
  String? id;

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        available: json["available"],
        image: json["image"],
        name: json["name"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "image": image,
        "name": name,
        "price": price,
      };
}
