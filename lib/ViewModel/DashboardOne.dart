import 'dart:convert';

DashBoardOne dashBoardOneFromJson(String str) =>
    DashBoardOne.fromJson(json.decode(str));

String dashBoardOneToJson(DashBoardOne data) => json.encode(data.toJson());

class DashBoardOne {
  DashBoardOne({
    this.data,
    this.isExecuted,
  });

  List<Datum> data;
  bool isExecuted;

  factory DashBoardOne.fromJson(Map<String, dynamic> json) => DashBoardOne(
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
    this.label,
    this.value,
  });

  String label;
  String value;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
