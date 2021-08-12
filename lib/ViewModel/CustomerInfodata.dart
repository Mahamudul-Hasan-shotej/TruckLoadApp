// To parse this JSON data, do
//
//     final customerInfodata = customerInfodataFromJson(jsonString);

import 'dart:convert';

CustomerInfodata customerInfodataFromJson(String str) =>
    CustomerInfodata.fromJson(json.decode(str));

String customerInfodataToJson(CustomerInfodata data) =>
    json.encode(data.toJson());

class CustomerInfodata {
  CustomerInfodata({
    this.data,
    this.isExecuted,
  });

  List<Datum> data;
  bool isExecuted;

  factory CustomerInfodata.fromJson(Map<String, dynamic> json) =>
      CustomerInfodata(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        isExecuted: json["isExecuted"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isExecuted": isExecuted,
      };
}

class Datum {
  Datum({
    this.createdAt,
    this.pictureName,
    this.createdDate,
    this.customerId,
    this.sk,
    this.orientation,
    this.pk,
    this.email,
    this.phone,
    this.name,
    this.type,
  });

  int createdAt;
  String pictureName;
  DateTime createdDate;
  String customerId;
  String sk;
  String orientation;
  String pk;
  String email;
  String phone;
  String name;
  String type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: json["created_at"],
        pictureName: json["picture_name"],
        createdDate: DateTime.parse(json["created_date"]),
        customerId: json["customer_id"],
        sk: json["sk"],
        orientation: json["orientation"],
        pk: json["pk"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "picture_name": pictureName,
        "created_date": createdDate.toIso8601String(),
        "customer_id": customerId,
        "sk": sk,
        "orientation": orientation,
        "pk": pk,
        "email": email,
        "phone": phone,
        "name": name,
        "type": type,
      };
}
