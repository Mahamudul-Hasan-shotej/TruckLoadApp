import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_load_demo/Models/Provider/OrderHistory/OrderHistoryProvider.dart';
import 'package:truck_load_demo/ViewModel/OrderHistoryModel.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Dashboard/Dashboard.dart';

import 'package:truck_load_demo/Views/OrderInfo/OrderDetails.dart';
import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;
import 'package:truck_load_demo/repositories/OrderHistory/OrderHistoryRepo.dart';
import '../Dashboard/Dashboard.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderHistoryRepo orderHistoryRepo = OrderHistoryRepo();
  List<String> formatedDate = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: ColorConfig.bagColour,
          appBar: AppBar(
            toolbarHeight: 7.52 * SizeConfig.heightMultiplier,
            backgroundColor: ColorConfig.themeColour,
            title: Text(
              'Order ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 2.50 * SizeConfig.textMultiplier,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              color: Colors.white,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: SizeConfig.screenHeight - 100,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                    vertical: 2.92 * SizeConfig.heightMultiplier,
                    horizontal: 4.86 * SizeConfig.widthMultiplier),
                decoration: BoxDecoration(
                  color: ColorConfig.bagColour,
                ),
                child: Consumer<OrderHistoryProvider>(
                  builder: (context, result, child) {
                    return FutureBuilder(
                        future: orderHistoryRepo.fetchOrderHistory(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              OrderData order = snapshot.data;
                              if (order.data.isNotEmpty) {
                                for (int i = 0; i < order.data.length; i++) {
                                  formatedDate.add(DateFormat('yyyy-MM-dd')
                                      .format(order.data[i].createdDate));
                                }

                                return ListView.builder(
                                  itemCount: order.data.length == null
                                      ? 0
                                      : order.data.length - 1,
                                  itemBuilder: (context, index) {
                                    if (order.data.length == 0) {
                                      return Container();
                                    } else {
                                      return Card(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        OrderDetails(
                                                          pk: order
                                                              .data[index].pk,
                                                          length: order
                                                              .data[index]
                                                              .truckType
                                                              .length,
                                                        )));
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.43 *
                                                        SizeConfig
                                                            .widthMultiplier,
                                                    vertical: 1.46 *
                                                        SizeConfig
                                                            .heightMultiplier),
                                                height: 13.17 *
                                                    SizeConfig.heightMultiplier,
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 2.43 *
                                                              SizeConfig
                                                                  .widthMultiplier,
                                                          vertical: 0.73 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 1.46 *
                                                                SizeConfig
                                                                    .heightMultiplier,
                                                          ),
                                                          Text(
                                                            "Date: " +
                                                                formatedDate[
                                                                    index],
                                                            style: TextStyle(
                                                                fontSize: 2.25 *
                                                                    SizeConfig
                                                                        .textMultiplier),
                                                          ),
                                                          SizedBox(
                                                            height: 0.73 *
                                                                SizeConfig
                                                                    .heightMultiplier,
                                                          ),
                                                          Text(
                                                            "Order ID:${order.data[index].orderId}",
                                                            style: TextStyle(
                                                                fontSize: 1.75 *
                                                                    SizeConfig
                                                                        .heightMultiplier,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width: 17.03 *
                                                              SizeConfig
                                                                  .widthMultiplier,
                                                          color: ColorConfig
                                                              .lightbagColour,
                                                          child: Center(
                                                              child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "${order.data[index].truckType.length}",
                                                                style: TextStyle(
                                                                    color: ColorConfig
                                                                        .lightThemeColour,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: 2.76 *
                                                                        SizeConfig
                                                                            .heightMultiplier),
                                                              ),
                                                              Text(
                                                                "Trips",
                                                                style: TextStyle(
                                                                    fontSize: 1.88 *
                                                                        SizeConfig
                                                                            .textMultiplier,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          )),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text("Invalid Customer"),
                                );
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  },
                ),
              ),
            ),
          )),
    );
  }
}
