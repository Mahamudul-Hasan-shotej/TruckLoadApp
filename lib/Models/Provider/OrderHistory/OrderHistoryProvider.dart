import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/Services/api_response.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/Views/OrderInfo/OrderHistory.dart';
import 'package:truck_load_demo/repositories/OrderHistory/OrderHistoryRepo.dart';
import 'package:truck_load_demo/ViewModel/OrderHistoryModel.dart';

class OrderHistoryProvider extends ChangeNotifier {
  OrderHistoryRepo _orderHistoryRepo;
  ApiResponse<OrderData> _orderHistoryModel;
  ApiResponse<OrderData> get orderHistoryModel => _orderHistoryModel;
  OrderHistoryProvider() {
    _orderHistoryRepo = OrderHistoryRepo();
    fatchOrderHistory();
  }

  fatchOrderHistory() async {
    _orderHistoryModel = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      OrderData orderHistoryData = await _orderHistoryRepo.fetchOrderHistory();
      _orderHistoryModel = ApiResponse.completed(orderHistoryData);
      notifyListeners();
    } catch (e) {
      _orderHistoryModel = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
