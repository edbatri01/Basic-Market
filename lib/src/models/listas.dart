// To parse this JSON data, do
//
//     final listas = listasFromJson(jsonString);

import 'dart:convert';
import 'package:basic_market/src/models/list_details.dart';
import 'package:http/http.dart' as http;

List<Listas> listasFromJson(String str) => List<Listas>.from(json.decode(str).map((x) => Listas.fromJson(x)));

String listasToJson(List<Listas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listas {
    Listas({
        this.idlistProducts,
        this.name,
        this.userId,
        this.activo,
    });

    int? idlistProducts;
    String? name;
    String? userId;
    int? activo;

    factory Listas.fromJson(Map<String, dynamic> json) => Listas(
        idlistProducts: json["idlist_Products"],
        name: json["name"],
        userId: json["user_id"],
        activo: json["activo"],
    );

    Map<String, dynamic> toJson() => {
        "idlist_Products": idlistProducts,
        "name": name,
        "user_id": userId,
        "activo": activo,
    };
}
