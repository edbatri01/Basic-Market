// To parse this JSON data, do
//
//     final productsByShop = productsByShopFromJson(jsonString);

import 'dart:convert';

ProductsByShop productsByShopFromJson(String str) =>
    ProductsByShop.fromJson(json.decode(str));

String productsByShopToJson(ProductsByShop data) => json.encode(data.toJson());

class ProductsByShop {
  ProductsByShop({
    required this.productsByShop,
  });

  List<ProductsByShopElement> productsByShop;

  factory ProductsByShop.fromJson(Map<String, dynamic> json) => ProductsByShop(
        productsByShop: List<ProductsByShopElement>.from(
            json["products_by_shop"]
                .map((x) => ProductsByShopElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products_by_shop":
            List<dynamic>.from(productsByShop.map((x) => x.toJson())),
      };
}

class ProductsByShopElement {
  ProductsByShopElement({
    required this.code,
    required this.idList,
    required this.idListItem,
    required this.idProduct,
    required this.price,
    required this.productName,
    required this.shopImg,
    required this.shopName,
    required this.urlImage,
  });

  String code;
  int idList;
  int idListItem;
  int idProduct;
  String price;
  String productName;
  String shopImg;
  String shopName;
  String urlImage;

  factory ProductsByShopElement.fromJson(Map<String, dynamic> json) =>
      ProductsByShopElement(
        code: json["code"],
        idList: json["id_list"],
        idListItem: json["id_list_item"],
        idProduct: json["id_product"],
        price: json["price"],
        productName: json["product_name"],
        shopImg: json["shop_img"],
        shopName: json["shop_name"],
        urlImage: json["url_image"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "id_list": idList,
        "id_list_item": idListItem,
        "id_product": idProduct,
        "price": price,
        "product_name": productName,
        "shop_img": shopImg,
        "shop_name": shopName,
        "url_image": urlImage,
      };
}
