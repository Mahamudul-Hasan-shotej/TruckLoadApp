import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/OrderHistoryModel.dart';
import 'package:truck_load_demo/ViewModel/OrderInfo.dart';
import 'package:truck_load_demo/Views/OrderInfo/OrderHistory.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class OrderHistoryRepo {
  OrderData orderHistory = OrderData();
  OrderInfo orderInfo = OrderInfo();
  Future<OrderData> fetchOrderHistory() async {
    final response =
        await AdditionalDataService.instance.fetchOrder(globals.pk);
    orderHistory = orderDataFromJson(response.body);
    return orderHistory;
  }

  Future<OrderInfo> fetchOrderInfo() async {
    final response =
        await AdditionalDataService.instance.fetchOrderinfo(globals.pk);
    orderInfo = orderInfoFromJson(response.body);
    return orderInfo;
  }
}
