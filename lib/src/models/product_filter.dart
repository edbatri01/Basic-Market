// To parse this JSON data, do
//
//     final productFilter = productFilterFromJson(jsonString);

import 'dart:convert';

ProductFilter productFilterFromJson(String str) => ProductFilter.fromJson(json.decode(str));

String productFilterToJson(ProductFilter data) => json.encode(data.toJson());

class ProductFilter {
    ProductFilter({
        required this.product,
    });

    List<Product> product;

    factory ProductFilter.fromJson(Map<String, dynamic> json) => ProductFilter(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.code,
        required this.id,
        required this.idCategory,
        required this.name,
        required this.price,
        required this.shopId,
        required this.shopImg,
        required this.shopName,
        required this.status,
        required this.urlImage,
    });

    String code;
    int id;
    int idCategory;
    String name;
    String price;
    int shopId;
    String shopImg;
    String shopName;
    int status;
    String urlImage;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        code: json["code"],
        id: json["id"],
        idCategory: json["id_category"],
        name: json["name"],
        price: json["price"],
        shopId: json["shop_id"],
        shopImg: json["shop_img"],
        shopName: json["shop_name"],
        status: json["status"],
        urlImage: json["url_image"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "id": id,
        "id_category": idCategory,
        "name": name,
        "price": price,
        "shop_id": shopId,
        "shop_img": shopImg,
        "shop_name": shopName,
        "status": status,
        "url_image": urlImage,
    };
}
