// To parse this JSON data, do
//
//     final orderData = orderDataFromJson(jsonString);

import 'dart:convert';

OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

String orderDataToJson(OrderData data) => json.encode(data.toJson());

class OrderData {
    OrderData({
        this.data,
        this.isExecuted,
    });

    List<Datum> data;
    bool isExecuted;

    factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
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
        this.previousStatus,
        this.customerType,
        this.createdAt,
        this.truckType,
        this.createdDate,
        this.status,
        this.customerId,
        this.orientation,
        this.email,
        this.name,
        this.orderDate,
        this.updatedBy,
        this.sk,
        this.orderId,
        this.numberOfConsignment,
        this.pk,
        this.phone,
    });

    String previousStatus;
    String customerType;
    int createdAt;
    List<TruckType> truckType;
    DateTime createdDate;
    String status;
    String customerId;
    String orientation;
    String email;
    String name;
    DateTime orderDate;
    String updatedBy;
    String sk;
    String orderId;
    String numberOfConsignment;
    String pk;
    String phone;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        previousStatus: json["previous_status"] == null ? null : json["previous_status"],
        customerType: json["customer_type"] == null ? null : json["customer_type"],
        createdAt: json["created_at"],
        truckType: json["truck_type"] == null ? null : List<TruckType>.from(json["truck_type"].map((x) => TruckType.fromJson(x))),
        createdDate: DateTime.parse(json["created_date"]),
        status: json["status"] == null ? null : json["status"],
        customerId: json["customer_id"],
        orientation: json["orientation"],
        email: json["email"],
        name: json["name"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        sk: json["sk"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        numberOfConsignment: json["number_of_consignment"] == null ? null : json["number_of_consignment"],
        pk: json["pk"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "previous_status": previousStatus == null ? null : previousStatus,
        "customer_type": customerType == null ? null : customerType,
        "created_at": createdAt,
        "truck_type": truckType == null ? null : List<dynamic>.from(truckType.map((x) => x.toJson())),
        "created_date": createdDate.toIso8601String(),
        "status": status == null ? null : status,
        "customer_id": customerId,
        "orientation": orientation,
        "email": email,
        "name": name,
        "order_date": orderDate == null ? null : orderDate.toIso8601String(),
        "updated_by": updatedBy == null ? null : updatedBy,
        "sk": sk,
        "order_id": orderId == null ? null : orderId,
        "number_of_consignment": numberOfConsignment == null ? null : numberOfConsignment,
        "pk": pk,
        "phone": phone,
    };
}

class TruckType {
    TruckType({
        this.driverName,
        this.quantity,
        this.truckLoadingPoint,
        this.truckStartingDate,
        this.truckLoadingDate,
        this.truckUnloadingPoint,
        this.length,
        this.weight,
        this.truckFare,
        this.type,
        this.cbm,
    });

    String driverName;
    int quantity;
    String truckLoadingPoint;
    DateTime truckStartingDate;
    DateTime truckLoadingDate;
    String truckUnloadingPoint;
    String length;
    String weight;
    String truckFare;
    String type;
    String cbm;

    factory TruckType.fromJson(Map<String, dynamic> json) => TruckType(
        driverName: json["driver_name"],
        quantity: json["quantity"],
        truckLoadingPoint: json["truck_loading_point"],
        truckStartingDate: DateTime.parse(json["truck_starting_date"]),
        truckLoadingDate: DateTime.parse(json["truck_loading_date"]),
        truckUnloadingPoint: json["truck_unloading_point"],
        length: json["length"],
        weight: json["weight"],
        truckFare: json["truck_fare"],
        type: json["type"],
        cbm: json["cbm"],
    );

    Map<String, dynamic> toJson() => {
        "driver_name": driverName,
        "quantity": quantity,
        "truck_loading_point": truckLoadingPoint,
        "truck_starting_date": "${truckStartingDate.year.toString().padLeft(4, '0')}-${truckStartingDate.month.toString().padLeft(2, '0')}-${truckStartingDate.day.toString().padLeft(2, '0')}",
        "truck_loading_date": "${truckLoadingDate.year.toString().padLeft(4, '0')}-${truckLoadingDate.month.toString().padLeft(2, '0')}-${truckLoadingDate.day.toString().padLeft(2, '0')}",
        "truck_unloading_point": truckUnloadingPoint,
        "length": length,
        "weight": weight,
        "truck_fare": truckFare,
        "type": type,
        "cbm": cbm,
    };
}
