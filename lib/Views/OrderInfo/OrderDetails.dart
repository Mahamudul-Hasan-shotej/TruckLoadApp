import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:truck_load_demo/ViewModel/OrderInfo.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

import 'package:truck_load_demo/Views/OrderInfo/LockScreen.dart';
import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/repositories/OrderHistory/OrderHistoryRepo.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;
import 'package:truck_load_demo/Views/OrderInfo/OrderHistory.dart';

class OrderDetails extends StatefulWidget {
  final String pk;
  final int length;
  OrderDetails({this.pk, this.length});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final _scrollController = ScrollController();
  OrderHistoryRepo orderHistoryRepo = OrderHistoryRepo();
  final iconList = <IconData>[
    Icons.home,
    Icons.shopping_bag,
    Icons.list_alt,
    Icons.person,
  ];
  final textList = ['Pending', 'Loaded', 'In transit', 'Unload'];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder(
        future: orderHistoryRepo.fetchOrderInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              OrderInfo orderInfo = snapshot.data;
              return Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 7.52 * SizeConfig.heightMultiplier,
                    backgroundColor: ColorConfig.themeColour,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Order ID: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 2.007 * SizeConfig.textMultiplier,
                              ),
                            ),
                            Text(
                              '${widget.pk}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 2.007 * SizeConfig.textMultiplier,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Total Trips: ${widget.length}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 1.88 * SizeConfig.textMultiplier,
                          ),
                        )
                      ],
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 2.50 * SizeConfig.heightMultiplier,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderHistory()));
                      },
                      color: Colors.white,
                    ),
                  ),
                  body: Scaffold(
                    backgroundColor: ColorConfig.bagColour,
                    body: SafeArea(
                      child: choseWidget(orderInfo),
                    ),
                  ),
                  bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                      itemCount: iconList.length,
                      height: 10.03 * SizeConfig.heightMultiplier,
                      tabBuilder: (int index, bool isActive) {
                        final color = isActive
                            ? ColorConfig.themeColour
                            : Color(0xffbdbdbd);
                        final fontcolor =
                            isActive ? Colors.black : Color(0xffbdbdbd);
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: color,
                                child: numberOfConsignments(orderInfo, index),
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
                      activeIndex: globals.bottomNavIndexOrderHistory,
                      gapLocation: GapLocation.none,
                      notchSmoothness: NotchSmoothness.softEdge,
                      onTap: (index) {
                        setState(() {
                          globals.bottomNavIndexOrderHistory = index;
                        });
                        if (index == 0) {
                        } else if (index == 1) {
                        } else if (index == 3) {
                        } else if (index == 2) {}
                      }));
            } else {
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 7.52 * SizeConfig.heightMultiplier,
                  backgroundColor: ColorConfig.themeColour,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order ID: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.007 * SizeConfig.textMultiplier,
                            ),
                          ),
                          Text(
                            '${widget.pk}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.007 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Total Trips: ${widget.length}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 1.882 * SizeConfig.textMultiplier,
                        ),
                      )
                    ],
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 2.50 * SizeConfig.heightMultiplier,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderHistory()));
                    },
                    color: Colors.white,
                  ),
                ),
                body: Container(
                    color: ColorConfig.bagColour,
                    child: Center(child: CircularProgressIndicator())),
              );
            }
          } else {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 7.52 * SizeConfig.heightMultiplier,
                backgroundColor: ColorConfig.themeColour,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order ID: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 2.007 * SizeConfig.textMultiplier,
                          ),
                        ),
                        Text(
                          '${widget.pk}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 2.007 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Total Trips: ${widget.length}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 1.882 * SizeConfig.textMultiplier,
                      ),
                    )
                  ],
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 2.50 * SizeConfig.heightMultiplier,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderHistory()));
                  },
                  color: Colors.white,
                ),
              ),
              backgroundColor: ColorConfig.bagColour,
              body: Container(
                  color: ColorConfig.bagColour,
                  child: Center(child: CircularProgressIndicator())),
            );
          }
        },
      ),
    );
  }

  Widget leftOrderList(String a) {
    if (a == 'Trip ID' || a == 'Rent Time') {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 1.46 * SizeConfig.heightMultiplier),
          width: 49.87 * SizeConfig.widthMultiplier,
          height: 4.39 * SizeConfig.heightMultiplier,
          color: Colors.transparent,
          child: Text(
            a,
            style: TextStyle(
                fontSize: 1.90 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 1.46 * SizeConfig.heightMultiplier),
          width: 49.87 * SizeConfig.widthMultiplier,
          height: 4.39 * SizeConfig.heightMultiplier,
          color: Colors.transparent,
          child: Text(
            a,
            style: TextStyle(
                fontSize: 1.90 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  Widget rightOrderList(var a, String b) {
    if (b == "Trip ID" || b == 'Rent Time' || b == 'Vaendor ID') {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 2.43 * SizeConfig.widthMultiplier,
              vertical: 1.46 * SizeConfig.heightMultiplier),
          height: 9.51 * SizeConfig.heightMultiplier,
          width: 49.87 * SizeConfig.widthMultiplier,
          color: Colors.transparent,
          child: Text(
            "$a",
            style: TextStyle(fontSize: 2.04 * SizeConfig.textMultiplier),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 2.43 * SizeConfig.widthMultiplier,
              vertical: 1.46 * SizeConfig.heightMultiplier),
          height: 5.12 * SizeConfig.heightMultiplier,
          width: 49.87 * SizeConfig.widthMultiplier,
          color: Colors.transparent,
          child: Text(
            "$a",
            style: TextStyle(
              fontSize: 2.04 * SizeConfig.textMultiplier,
            ),
          ),
        ),
      );
    }
  }

  Widget listOfOrder(OrderInfo orderInfo, List<InTransit> status) {
    return Container(
      height: SizeConfig.screenHeight - 100,
      color: ColorConfig.bagColour,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          vertical: 2.92 * SizeConfig.heightMultiplier,
          horizontal: 4.86 * SizeConfig.widthMultiplier),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: SizeConfig.screenHeight - 200,
            width: SizeConfig.screenWidth,
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: status.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        color: Colors.white,
                        height: 71.00 * SizeConfig.heightMultiplier,
                        width: 145.9 * SizeConfig.widthMultiplier,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.46 * SizeConfig.heightMultiplier,
                            horizontal: 2.43 * SizeConfig.widthMultiplier),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                leftOrderList('Trip Id'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].tripId, 'Trip ID')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(children: [
                              leftOrderList('Truck ID'),
                              SizedBox(
                                width: 1.21 * SizeConfig.widthMultiplier,
                              ),
                              rightOrderList(status[index].truckId, 'Trip ID'),
                            ]),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Round Trip'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].roundTrip, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Loading Point'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].loadingPoint, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Unloading Point'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].unloadingPoint, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Truck Type'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].type, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Status'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].status, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Phone No'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].phone, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Vendor Name'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].vendorName, '')
                              ],
                            ),
                            Container(
                              height: 0.25 * SizeConfig.heightMultiplier,
                              width: double.infinity,
                              color: Color(0xffF7F5F5),
                            ),
                            Row(
                              children: [
                                leftOrderList('Previous Status'),
                                SizedBox(
                                  width: 1.21 * SizeConfig.widthMultiplier,
                                ),
                                rightOrderList(status[index].previousStatus, '')
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Center(
                                child: ButtonTheme(
                                  height: 5.27 * SizeConfig.heightMultiplier,
                                  child: RaisedButton(
                                    elevation: 2,
                                    child: Text(
                                      'Monitor',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              2.04 * SizeConfig.textMultiplier),
                                    ),
                                    color: ColorConfig.themeColour,
                                    onPressed: () {
                                      globals.buttomNavIot = 0;
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => LockScreen(
                                                    pk: widget.pk,
                                                    length: widget.length,
                                                  )));
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  numberOfConsignments(OrderInfo orderInfo, int index) {
    if (index == 0) {
      return Text(
        "${orderInfo.data[index].pending.length}",
        style: TextStyle(fontSize: 1.882 * SizeConfig.textMultiplier),
      );
    } else if (index == 1) {
      return Text(
        "${orderInfo.data[index].loadCompleted.length}",
        style: TextStyle(fontSize: 1.882 * SizeConfig.textMultiplier),
      );
    } else if (index == 2) {
      return Text(
        "${orderInfo.data[index].inTransit.length}",
        style: TextStyle(fontSize: 1.882 * SizeConfig.textMultiplier),
      );
    } else if (index == 3) {
      return Text(
        "${orderInfo.data[index].unloadComplete.length}",
        style: TextStyle(fontSize: 1.882 * SizeConfig.textMultiplier),
      );
    }
  }

  Widget choseWidget(OrderInfo orderInfo) {
    if (globals.bottomNavIndexOrderHistory == 0) {
      return listOfOrder(orderInfo, orderInfo.data[0].pending);
    } else if (globals.bottomNavIndexOrderHistory == 1) {
      return listOfOrder(orderInfo, orderInfo.data[1].loadCompleted);
    } else if (globals.bottomNavIndexOrderHistory == 2) {
      return listOfOrder(orderInfo, orderInfo.data[2].inTransit);
    } else if (globals.bottomNavIndexOrderHistory == 3) {
      return listOfOrder(orderInfo, orderInfo.data[3].unloadComplete);
    }
    return null;
  }
}
