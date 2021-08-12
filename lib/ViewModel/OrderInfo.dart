// To parse this JSON data, do
//
//     final orderInfo = orderInfoFromJson(jsonString);

import 'dart:convert';

OrderInfo orderInfoFromJson(String str) => OrderInfo.fromJson(json.decode(str));

String orderInfoToJson(OrderInfo data) => json.encode(data.toJson());

class OrderInfo {
    OrderInfo({
        this.data,
        this.isExecuted,
    });

    List<Datum> data;
    bool isExecuted;

    factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
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
        this.pending,
        this.loadCompleted,
        this.inTransit,
        this.unloadComplete,
    });

    List<InTransit> pending;
    List<InTransit> loadCompleted;
    List<InTransit> inTransit;
    List<InTransit> unloadComplete;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pending: json["pending"] == null ? null : List<InTransit>.from(json["pending"].map((x) => InTransit.fromJson(x))),
        loadCompleted: json["loadCompleted"] == null ? null : List<InTransit>.from(json["loadCompleted"].map((x) => InTransit.fromJson(x))),
        inTransit: json["inTransit"] == null ? null : List<InTransit>.from(json["inTransit"].map((x) => InTransit.fromJson(x))),
        unloadComplete: json["unloadComplete"] == null ? null : List<InTransit>.from(json["unloadComplete"].map((x) => InTransit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pending": pending == null ? null : List<dynamic>.from(pending.map((x) => x.toJson())),
        "loadCompleted": loadCompleted == null ? null : List<dynamic>.from(loadCompleted.map((x) => x.toJson())),
        "inTransit": inTransit == null ? null : List<dynamic>.from(inTransit.map((x) => x.toJson())),
        "unloadComplete": unloadComplete == null ? null : List<dynamic>.from(unloadComplete.map((x) => x.toJson())),
    };
}

class InTransit {
    InTransit({
        this.previousStatus,
        this.createdAt,
        this.truckId,
        this.roundTrip,
        this.status,
        this.createdDate,
        this.unloadingPoint,
        this.orientation,
        this.cbm,
        this.prevRentStatus,
        this.tripId,
        this.weight,
        this.length,
        this.updatedBy,
        this.rentTime,
        this.truckReg,
        this.sk,
        this.orderId,
        this.vendorName,
        this.pk,
        this.phone,
        this.loadingPoint,
        this.type,
        this.vendorId,
    });

    String previousStatus;
    int createdAt;
    String truckId;
    String roundTrip;
    String status;
    DateTime createdDate;
    String unloadingPoint;
    String orientation;
    String cbm;
    String prevRentStatus;
    String tripId;
    String weight;
    String length;
    String updatedBy;
    DateTime rentTime;
    String truckReg;
    String sk;
    String orderId;
    String vendorName;
    String pk;
    String phone;
    String loadingPoint;
    String type;
    String vendorId;

    factory InTransit.fromJson(Map<String, dynamic> json) => InTransit(
        previousStatus: json["previous_status"],
        createdAt: json["created_at"],
        truckId: json["truck_id"],
        roundTrip: json["round_trip"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        unloadingPoint: json["unloading_point"],
        orientation: json["orientation"],
        cbm: json["cbm"],
        prevRentStatus: json["prev_rent_status"],
        tripId: json["trip_id"],
        weight: json["weight"],
        length: json["length"],
        updatedBy: json["updated_by"],
        rentTime: DateTime.parse(json["rent_time"]),
        truckReg: json["truck_reg"],
        sk: json["sk"],
        orderId: json["order_id"],
        vendorName: json["vendor_name"],
        pk: json["pk"],
        phone: json["phone"],
        loadingPoint: json["loading_point"],
        type: json["type"],
        vendorId: json["vendor_id"],
    );

    Map<String, dynamic> toJson() => {
        "previous_status": previousStatus,
        "created_at": createdAt,
        "truck_id": truckId,
        "round_trip": roundTrip,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "unloading_point": unloadingPoint,
        "orientation": orientation,
        "cbm": cbm,
        "prev_rent_status": prevRentStatus,
        "trip_id": tripId,
        "weight": weight,
        "length": length,
        "updated_by": updatedBy,
        "rent_time": rentTime.toIso8601String(),
        "truck_reg": truckReg,
        "sk": sk,
        "order_id": orderId,
        "vendor_name": vendorName,
        "pk": pk,
        "phone": phone,
        "loading_point": loadingPoint,
        "type": type,
        "vendor_id": vendorId,
    };
}
