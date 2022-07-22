// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Products({
        required this.items,
    });

    List<Item> items;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.code,
        required this.id,
        required this.idCategory,
        required this.name,
        required this.shopId,
        required this.status,
        required this.urlImage,
    });

    String code;
    int id;
    int idCategory;
    String name;
    int shopId;
    int status;
    String urlImage;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        code: json["code"],
        id: json["id"],
        idCategory: json["id_category"] == null ? null : json["id_category"],
        name: json["name"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        status: json["status"],
        urlImage: json["url_image"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "id": id,
        "id_category": idCategory == null ? null : idCategory,
        "name": name,
        "shop_id": shopId == null ? null : shopId,
        "status": status,
        "url_image": urlImage,
    };
}
