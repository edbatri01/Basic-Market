// To parse this JSON data, do
//
//     final listDetails = listDetailsFromJson(jsonString);

import 'dart:convert';

List<ListDetails> listDetailsFromJson(String str) => List<ListDetails>.from(json.decode(str).map((x) => ListDetails.fromJson(x)));

String listDetailsToJson(List<ListDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDetails {
    ListDetails({
        required this.idListDetails,
        required this.productId,
        required this.activo,
    });

    String idListDetails;
    ProductId productId;
    String activo;

    factory ListDetails.fromJson(Map<String, dynamic> json) => ListDetails(
        idListDetails: json["id_list_details"],
        productId: ProductId.fromJson(json["product_id"]),
        activo: json["activo"],
    );

    Map<String, dynamic> toJson() => {
        "id_list_details": idListDetails,
        "product_id": productId.toJson(),
        "activo": activo,
    };
}

class ProductId {
    ProductId({
        required this.listItemId,
        required this.code,
        required this.id,
        required this.price,
        required this.productName,
        required this.shopId,
        required this.shopImg,
        required this.shopName,
        required this.urlImage,
    });

    int listItemId;
    String code;
    int id;
    String price;
    String productName;
    int shopId;
    String shopImg;
    String shopName;
    String urlImage;

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        listItemId: json["List_item_id"],
        code: json["code"],
        id: json["id"],
        price: json["price"],
        productName: json["product_name"],
        shopId: json["shop_id"],
        shopImg: json["shop_img"],
        shopName: json["shop_name"],
        urlImage: json["url_image"],
    );

    Map<String, dynamic> toJson() => {
        "List_item_id": listItemId,
        "code": code,
        "id": id,
        "price": price,
        "product_name": productName,
        "shop_id": shopId,
        "shop_img": shopImg,
        "shop_name": shopName,
        "url_image": urlImage,
    };
}
