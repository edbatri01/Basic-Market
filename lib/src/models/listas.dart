// To parse this JSON data, do
//
//     final listas = listasFromJson(jsonString);

import 'dart:convert';

List<Listas> listasFromJson(String str) => List<Listas>.from(json.decode(str).map((x) => Listas.fromJson(x)));

String listasToJson(List<Listas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listas {
    Listas({
        this.idlistProducts,
        this.name,
        this.activo,
        this.precioLista,
        this.productosC,
    });

    int ?idlistProducts;
    String ? name;
    int ? activo;
    double ? precioLista;
    int ? productosC;

    factory Listas.fromJson(Map<String, dynamic> json) => Listas(
        idlistProducts: json["idlist_Products"],
        name: json["name"],
        activo: json["activo"],
        precioLista: json["precioLista"] == null ? null : json["precioLista"].toDouble(),
        productosC: json["productosC"],
    );

    Map<String, dynamic> toJson() => {
        "idlist_Products": idlistProducts,
        "name": name,
        "activo": activo,
        "precioLista": precioLista == null ? null : precioLista,
        "productosC": productosC,
    };
}
