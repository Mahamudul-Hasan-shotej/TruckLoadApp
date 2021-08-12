import 'package:flutter/cupertino.dart';
import 'package:truck_load_demo/Models/Services/api_response.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/repositories/Dashboard/deshBoardOne_repo.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class DashboardDetailsProvider with ChangeNotifier {
  DashBoardRepo _boardRepo;
  ApiResponse<DashBoardOne> _dashboardOne;
  ApiResponse<DashBoardOne> get dashboardone => _dashboardOne;

  DashboardDetailsProvider() {
    _boardRepo = DashBoardRepo();
    fetchDashboardOneDetais();
  }

  fetchDashboardOneDetais() async {
    _dashboardOne = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      DashBoardOne dashBoardOne = await _boardRepo.fetchDashboardOneDetais();
      _dashboardOne = ApiResponse.completed(dashBoardOne);
      notifyListeners();
    } catch (e) {
      _dashboardOne = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
