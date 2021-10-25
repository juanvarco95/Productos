// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

// import 'package:flutter/cupertino.dart';

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

  get fullImage {
    if (image != null) return image;
    return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  }

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
