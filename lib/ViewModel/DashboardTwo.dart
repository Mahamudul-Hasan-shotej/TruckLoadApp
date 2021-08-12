import 'dart:convert';

DashBoardtwo dashBoardtwoFromJson(String str) =>
    DashBoardtwo.fromJson(json.decode(str));

String dashBoardtwoToJson(DashBoardtwo data) => json.encode(data.toJson());

class DashBoardtwo {
  DashBoardtwo({
    this.data,
    this.isExecuted,
  });

  List<Datatwo> data;
  bool isExecuted;

  factory DashBoardtwo.fromJson(Map<String, dynamic> json) => DashBoardtwo(
        data: List<Datatwo>.from(json["data"].map((x) => Datatwo.fromJson(x))),
        isExecuted: json["isExecuted"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isExecuted": isExecuted,
      };
}

class Datatwo {
  Datatwo({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory Datatwo.fromJson(Map<String, dynamic> json) => Datatwo(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
