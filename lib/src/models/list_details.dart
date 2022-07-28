// To parse this JSON data, do
//
//     final detallesproductos = detallesproductosFromJson(jsonString);

import 'dart:convert';

List<Detallesproductos> detallesproductosFromJson(String str) => List<Detallesproductos>.from(json.decode(str).map((x) => Detallesproductos.fromJson(x)));

String detallesproductosToJson(List<Detallesproductos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Detallesproductos {
    Detallesproductos({
        this.idListDetails,
        this.name,
        this.urlImage,
        this.cantidad,
        this.price,
        this.tienda,
    });

    int ?idListDetails;
    String ?name;
    String ?urlImage;
    int ?cantidad;
    double ?price;
    String ?tienda;

    factory Detallesproductos.fromJson(Map<String, dynamic> json) => Detallesproductos(
        idListDetails: json["id_list_details"],
        name: json["name"],
        urlImage: json["url_image"],
        cantidad: json["cantidad"],
        price: json["price"].toDouble(),
        tienda: json["tienda"],
    );

    Map<String, dynamic> toJson() => {
        "id_list_details": idListDetails,
        "name": name,
        "url_image": urlImage,
        "cantidad": cantidad,
        "price": price,
        "tienda": tienda,
    };
}
