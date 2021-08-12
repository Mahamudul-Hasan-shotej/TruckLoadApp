import 'dart:async';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_load_demo/Models/Provider/Dashboard/DashBoardOneProvider.dart';
import 'package:truck_load_demo/Views/BottomScreen/OrderButtomModalSheet.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:truck_load_demo/ViewModel/ChartDataConsumtion.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/ViewModel/DashboardTwo.dart';
import 'package:truck_load_demo/ViewModel/OrderHistoryModel.dart';

import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Login/LoginScreen.dart';
import 'package:truck_load_demo/Views/Order/AddOrder.dart';
import 'package:truck_load_demo/Views/OrderInfo/OrderHistory.dart';
import 'package:truck_load_demo/Views/Profile/Profile.dart';
import 'package:truck_load_demo/repositories/Dashboard/deshBoardOne_repo.dart';

import '../Order/Global.dart' as globals;

import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/widgets/data_cart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map mapResponse;
  static List<int> listOfdata =
      List(5); //list for parsing the Dshboaard two data to int
  String pk;
  String mail;
  DashBoardRepo dashBoardRepo = DashBoardRepo();
  OrderModalButtom modalButtom = OrderModalButtom();
  DashBoardOne dataone = DashBoardOne();
  DashBoardtwo datatwo = DashBoardtwo();
  OrderData orderData = OrderData();
  CustomerInfodata customerInfodata = CustomerInfodata();
  var fradius = (7.32 * SizeConfig.heightMultiplier).round();
  double frad;

  @override
  void initState() {
    getdata();
    super.initState();
    frad = fradius.toDouble();
  }

  //getting the data from model through Api service
  getdata() async {
    var info = await Amplify.Auth.getCurrentUser();

    mail = info.username;
    // mail = 'bata2@gmail.com'; // as Data is not updated
    customerInfodata = await AdditionalDataService.fetchClientInfo(mail);
    if (customerInfodata.data.isNotEmpty) {
      globals.pk = customerInfodata.data[0].pk;
      pk = customerInfodata.data[0].pk;
      print(pk);
    } else {
      print('No Data in user thread');
    }

    //orderData = await AdditionalDataService.fetchOrder(pk);
    //dataone = await AdditionalDataService.fetchDataOne(pk);
    //print(dataone.data[0].value);
    datatwo = await AdditionalDataService.fetchDatatwo(pk);
    //print('Name of client ${customerInfodata.data[0].name}');
    int length = datatwo.data.length;

    if (datatwo.data.isNotEmpty) {
      for (int i = 0; i < length; i++) {
        listOfdata[i] = int.parse(datatwo.data[i].value);
      }
    }

    //print(datatwo.data[0].label);
  }

  //Sending the listOfData and colour to BarChart
  final List<ChartDataConsumtion> data = [
    ChartDataConsumtion(
        data: listOfdata[0],
        //data: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
        title: "1"),
    ChartDataConsumtion(
        data: listOfdata[1],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffFCAE00)),
        title: "2"),
    ChartDataConsumtion(
        data: listOfdata[2],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffE80000)),
        title: "3"),
    ChartDataConsumtion(
        data: listOfdata[3],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffFA80FA)),
        title: "4"),
    ChartDataConsumtion(
        data: listOfdata[4],
        barColor: charts.ColorUtil.fromDartColor(Color(0xff8613C3)),
        title: "5"),
  ];

  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.home,
      Icons.shopping_bag,
      Icons.list_alt,
      Icons.person,
    ];
    final textList = ['Home', 'Orders', 'History', 'Profile'];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: ColorConfig.bagColour,
          body: RefreshIndicator(
            onRefresh: refresh,
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          height: 21.96 * SizeConfig.heightMultiplier,
                          width: SizeConfig.screenWidth,
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          color: ColorConfig.themeColour,
                        ),
                        Positioned(
                          left: 1.027 * SizeConfig.widthMultiplier,
                          top: 10 * SizeConfig.heightMultiplier,
                          child: Container(
                            height: 7.32 * SizeConfig.heightMultiplier,
                            margin: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 4.86 * SizeConfig.widthMultiplier),
                            child: Text(
                              'TruckLoad',
                              style: TextStyle(
                                fontFamily: 'SecularOne',
                                fontSize: 4.97 * SizeConfig.textMultiplier,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 72.99 * SizeConfig.widthMultiplier,
                          top: 10 * SizeConfig.heightMultiplier,
                          child: Container(
                              height: 7.32 * SizeConfig.heightMultiplier,
                              margin: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal:
                                      4.86 * SizeConfig.widthMultiplier),
                              child: GestureDetector(
                                onTap: () async {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.remove('email');
                                  _sineoutButtonPressed(context);
                                },
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 4.39 * SizeConfig.textMultiplier,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 1.46 * SizeConfig.heightMultiplier,
                        horizontal: 4.86 * SizeConfig.widthMultiplier),
                    height: 18 * SizeConfig.heightMultiplier,
                    child: FutureBuilder(
                        future: dashBoardRepo.fetchDashboardOneDetais(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Consumer<DashboardDetailsProvider>(
                                  builder: (context, result, child) {
                                if (result.dashboardone.message !=
                                    'loading... ') {
                                  return Container(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        cardviews(
                                            result.dashboardone.data.data[0]
                                                .value,
                                            "Successful"),
                                        SizedBox(
                                          width:
                                              1.21 * SizeConfig.widthMultiplier,
                                        ), //sending data and status to the card view
                                        cardviews(
                                            result.dashboardone.data.data[1]
                                                .value,
                                            "Cancelled"),
                                        SizedBox(
                                          width:
                                              1.21 * SizeConfig.widthMultiplier,
                                        ),
                                        cardviews(
                                            result.dashboardone.data.data[2]
                                                .value,
                                            "On Progress"),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }

                            //
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: 7.29 * SizeConfig.widthMultiplier),
                      child: Text(
                        'Order Status',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 2.92 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    height: 0.73 * SizeConfig.heightMultiplier,
                  ),
                  // Positioned(
                  //   left: 100,
                  //   child: Text('Order Status'),
                  // ),
                  Container(
                    // color: Color(0xffEAFFEE),
                    // height: 150,
                    // width: 200,
                    padding: EdgeInsets.symmetric(
                        horizontal: 5 * SizeConfig.widthMultiplier,
                        vertical: 0),

                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 02,
                      child: Column(
                        children: [
                          Container(
                            height: 30 * SizeConfig.heightMultiplier,
                            width: SizeConfig.screenWidth,
                            child: DataChart(
                              // setting bar chart in a container
                              data: data,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            height: frad,
            width: frad,
            child: FloatingActionButton(
              elevation: 3,
              backgroundColor: ColorConfig.themeColour,
              child: Icon(
                Icons.local_shipping,
                color: Colors.white,
                size: 5.12 * SizeConfig.textMultiplier,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddOrder(customerData: customerInfodata)));
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: iconList.length,
              height: 8.78 * SizeConfig.heightMultiplier,
              tabBuilder: (int index, bool isActive) {
                final color =
                    isActive ? ColorConfig.themeColour : Color(0xffbdbdbd);
                final fontcolor = isActive ? Colors.black : Color(0xffbdbdbd);
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconList[index],
                        size: 3.66 * SizeConfig.textMultiplier,
                        color: color,
                      ),
                      Text(
                        textList[index],
                        style: TextStyle(
                            fontSize: 1.46 * SizeConfig.textMultiplier,
                            color: fontcolor,
                            fontWeight: FontWeight.bold),
                      )
                    ]);
              },
              activeIndex: globals.bottomNavIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 10,
              rightCornerRadius: 10,
              onTap: (index) {
                setState(() {
                  globals.bottomNavIndex = index;
                });
                if (index == 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                } else if (index == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                  modalButtom.showModalBottomSheetOrder(context);
                } else if (index == 3) {
                  if (customerInfodata.data == null) {
                    print('null');
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                  customerData: customerInfodata,
                                )));
                  }
                } else if (index == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderHistory()));
                }
              })),
    );
  }

  Future<void> _sineoutButtonPressed(BuildContext context) async {
    try {
      final signOutResult = await Amplify.Auth.signOut();

      if (signOutResult != null) {
        globals.pk = null;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreenOne()));
      }
    } catch (e) {
      print(e);
    }
  }

  Container cardviews(String data, String heading) {
    return Container(
      width: 29 * SizeConfig.widthMultiplier,
      height: 2.85 * SizeConfig.heightMultiplier,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 02,
        child: Padding(
          padding: EdgeInsets.only(top: 4.39 * SizeConfig.heightMultiplier),
          child: Column(
            children: [
              Text(
                data,
                style: TextStyle(
                  //fontFamily: 'SecularOne',
                  fontWeight: FontWeight.bold,
                  fontSize: 5.85 * SizeConfig.textMultiplier,
                  color: ColorConfig.themeColour,
                ),
              ),
              SizedBox(
                height: 1.17 * SizeConfig.heightMultiplier,
              ),
              Text(
                heading,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 2 * SizeConfig.textMultiplier,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> refresh() async {
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(seconds: 2)).then((_) {
      completer.complete();
    });

    return completer.future;
  }
}
