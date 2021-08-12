import 'dart:io';

import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class DashBoardRepo {
  DashBoardOne resOne = DashBoardOne();

  Future<DashBoardOne> fetchDashboardOneDetais() async {
    final response =
        await AdditionalDataService.instance.fetchDashboardOneData(globals.pk);
    print("Response - $response");
    resOne = dashBoardOneFromJson(response.body);

    return resOne;
  }
}
