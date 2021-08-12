import 'dart:convert';

Orderformdata orderformdataFromJson(String str) =>
    Orderformdata.fromJson(json.decode(str));

String orderformdataToJson(Orderformdata data) => json.encode(data.toJson());

class Orderformdata {
  Orderformdata({
    this.createdDate,
    this.customerId,
    this.customerType,
    this.email,
    this.name,
    this.numberOfConsignment,
    this.orderDate,
    this.orderId,
    this.orientation,
    this.phone,
    this.pk,
    this.previousStatus,
    this.sk,
    this.status,
    this.truckType,
    this.updatedBy,
  });

  DateTime createdDate;
  String customerId;
  String customerType;
  String email;
  String name;
  String numberOfConsignment;
  DateTime orderDate;
  String orderId;
  String orientation;
  String phone;
  String pk;
  String previousStatus;
  String sk;
  String status;
  List<TruckType> truckType;
  String updatedBy;

  factory Orderformdata.fromJson(Map<String, dynamic> json) => Orderformdata(
        createdDate: DateTime.parse(json["created_date"]),
        customerId: json["customer_id"],
        customerType: json["customer_type"],
        email: json["email"],
        name: json["name"],
        numberOfConsignment: json["number_of_consignment"],
        orderDate: DateTime.parse(json["order_date"]),
        orderId: json["order_id"],
        orientation: json["orientation"],
        phone: json["phone"],
        pk: json["pk"],
        previousStatus: json["previous_status"],
        sk: json["sk"],
        status: json["status"],
        truckType: List<TruckType>.from(
            json["truck_type"].map((x) => TruckType.fromJson(x))),
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "created_date": createdDate.toIso8601String(),
        "customer_id": customerId,
        "customer_type": customerType,
        "email": email,
        "name": name,
        "number_of_consignment": numberOfConsignment,
        "order_date": orderDate.toIso8601String(),
        "order_id": orderId,
        "orientation": orientation,
        "phone": phone,
        "pk": pk,
        "previous_status": previousStatus,
        "sk": sk,
        "status": status,
        "truck_type": List<dynamic>.from(truckType.map((x) => x.toJson())),
        "updated_by": updatedBy,
      };
}

class TruckType {
  TruckType({
    this.cbm,
    this.driverName,
    this.length,
    this.quantity,
    this.truckFare,
    this.truckLoadingDate,
    this.truckLoadingPoint,
    this.truckStartingDate,
    this.truckUnloadingPoint,
    this.type,
    this.weight,
  });

  String cbm;
  String driverName;
  String length;
  int quantity;
  String truckFare;
  DateTime truckLoadingDate;
  String truckLoadingPoint;
  DateTime truckStartingDate;
  String truckUnloadingPoint;
  String type;
  String weight;

  factory TruckType.fromJson(Map<String, dynamic> json) => TruckType(
        cbm: json["cbm"],
        driverName: json["driver_name"],
        length: json["length"],
        quantity: json["quantity"],
        truckFare: json["truck_fare"],
        truckLoadingDate: DateTime.parse(json["truck_loading_date"]),
        truckLoadingPoint: json["truck_loading_point"],
        truckStartingDate: DateTime.parse(json["truck_starting_date"]),
        truckUnloadingPoint: json["truck_unloading_point"],
        type: json["type"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "cbm": cbm,
        "driver_name": driverName,
        "length": length,
        "quantity": quantity,
        "truck_fare": truckFare,
        "truck_loading_date":
            "${truckLoadingDate.year.toString().padLeft(4, '0')}-${truckLoadingDate.month.toString().padLeft(2, '0')}-${truckLoadingDate.day.toString().padLeft(2, '0')}",
        "truck_loading_point": truckLoadingPoint,
        "truck_starting_date":
            "${truckStartingDate.year.toString().padLeft(4, '0')}-${truckStartingDate.month.toString().padLeft(2, '0')}-${truckStartingDate.day.toString().padLeft(2, '0')}",
        "truck_unloading_point": truckUnloadingPoint,
        "type": type,
        "weight": weight,
      };
}
