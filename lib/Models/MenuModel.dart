// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

List<Menu> menuFromJson(String str) =>
    List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  Menu({
    required this.id,
    required this.name,
    required this.cafeId,
    required this.price,
    required this.type,
    required this.v,
  });

  String id;
  String name;
  String cafeId;
  int price;
  String type;
  int v;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["_id"],
        name: json["name"],
        cafeId: json["cafeId"],
        price: json["price"],
        type: json["type"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "cafeId": cafeId,
        "price": price,
        "type": type,
        "__v": v,
      };
}
