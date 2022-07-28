// To parse this JSON data, do
//
//     final direcciones = direccionesFromJson(jsonString);

import 'dart:convert';

List<Direcciones> direccionesFromJson(String str) => List<Direcciones>.from(json.decode(str).map((x) => Direcciones.fromJson(x)));

String direccionesToJson(List<Direcciones> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Direcciones {
    Direcciones({
        this.idDirecciones,
        this.name,
        this.postal,
        this.detalles,
        this.descripcion,
        this.idUser,
        this.activo,
    });

    int ? idDirecciones;
    String ?name;
    String ?postal;
    String ?detalles;
    String ?descripcion;
    String ?idUser;
    String ?activo;

    factory Direcciones.fromJson(Map<String, dynamic> json) => Direcciones(
        idDirecciones: json["id_direcciones"],
        name: json["name"],
        postal: json["postal"],
        detalles: json["detalles"],
        descripcion: json["descripcion"],
        idUser: json["id_user"],
        activo: json["activo"],
    );

    Map<String, dynamic> toJson() => {
        "id_direcciones": idDirecciones,
        "name": name,
        "postal": postal,
        "detalles": detalles,
        "descripcion": descripcion,
        "id_user": idUser,
        "activo": activo,
    };
}
