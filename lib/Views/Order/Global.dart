library my_prj.globals;

import 'package:image_picker/image_picker.dart';
import 'package:truck_load_demo/ViewModel/OrderFormData.dart';

List<Orderformdata> orderfromdata = [];
List<TruckType> truckType = [];
var bottomNavIndex = 0;
var bottomNavIndexOrderHistory = 0;
var buttomNavIot = 0;
PickedFile imageFlie;
String imageUrl = '';
 String pk;
bool aplifyConfig = false;
String lockStatus = "Unlocked";
