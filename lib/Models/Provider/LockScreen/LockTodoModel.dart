import 'package:flutter/cupertino.dart';
import 'package:truck_load_demo/Models/Provider/LockScreen/LockTaskModel.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class LockTodoModel extends ChangeNotifier {
  List<LockTaskModel> tasklist = [];

  

  void addTaskList(String status,String image) {
    tasklist.clear();
    LockTaskModel lockTaskModel = LockTaskModel(status,image);
    tasklist.add(lockTaskModel);
    if (status == "Locked") {
      globals.lockStatus = 'Locked';
    } else {
      globals.lockStatus = 'Unlocked';
    }
    notifyListeners();
  }
}
