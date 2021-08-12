import 'package:flutter/material.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/ViewModel/OrderFormData.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Order/Order.dart';
import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'Global.dart' as globals;
import '../Dashboard/Dashboard.dart';

class ListOfOrder extends StatefulWidget {
  final CustomerInfodata customerData;
  final Orderformdata orderdata;

  ListOfOrder({this.customerData, this.orderdata});
  @override
  _ListOfOrderState createState() => _ListOfOrderState();
}

class _ListOfOrderState extends State<ListOfOrder> {
  CustomerInfodata customerInfodata = CustomerInfodata();
  var ficon = (4.39 * SizeConfig.heightMultiplier).round();
  double ficonrad;
  @override
  void initState() {
    ficonrad = ficon.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //globals.orderfromdata.add(widget.orderdata);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorConfig.bagColour,
        appBar: AppBar(
          toolbarHeight: 8.78 * SizeConfig.heightMultiplier,
          backgroundColor: ColorConfig.themeColour,
          title: Text(
            'Order Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 2.92 * SizeConfig.textMultiplier,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 2.92 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(
                    vertical: 2.92 * SizeConfig.heightMultiplier,
                    horizontal: 4.86 * SizeConfig.widthMultiplier),
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                          height: 73.2 * SizeConfig.heightMultiplier,
                          padding: EdgeInsets.symmetric(
                              vertical: 1.46 * SizeConfig.heightMultiplier,
                              horizontal: 2.43 * SizeConfig.widthMultiplier),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ListView.builder(
                            itemCount: globals.truckType.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            2.43 * SizeConfig.widthMultiplier,
                                        vertical:
                                            1.46 * SizeConfig.heightMultiplier),
                                    height: 23.42 * SizeConfig.heightMultiplier,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Container(
                                          color: ColorConfig.lightbagColour,
                                          height: 7.32 *
                                              SizeConfig.heightMultiplier,
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 2.43 *
                                                  SizeConfig.widthMultiplier),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    ColorConfig.themeColour,
                                                child: Icon(
                                                  Icons.local_shipping,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.21 *
                                                    SizeConfig.widthMultiplier,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 1.46 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  horizontal: 2.43 *
                                                      SizeConfig
                                                          .widthMultiplier,
                                                ),
                                                child: Text(
                                                  globals.truckType[index]
                                                          .length +
                                                      ', ' +
                                                      globals.truckType[index]
                                                          .weight +
                                                      ', ' +
                                                      globals.truckType[index]
                                                          .type,
                                                  style: TextStyle(
                                                      fontSize: 2.19 *
                                                          SizeConfig
                                                              .textMultiplier),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      globals.truckType
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 2.92 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    color: Color(0xffCF2426),
                                                  ),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 11.71 *
                                              SizeConfig.heightMultiplier,
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 0.73 *
                                                SizeConfig.heightMultiplier,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_up_outlined,
                                                    size: 5.12 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    color: Color(0xff006A66),
                                                  ),
                                                  SizedBox(
                                                    width: 1.21 *
                                                        SizeConfig
                                                            .widthMultiplier,
                                                  ),
                                                  Text(
                                                    globals.truckType[index]
                                                        .truckLoadingPoint,
                                                    style: TextStyle(
                                                      color: Color(0xff727272),
                                                      fontSize: 2.19 *
                                                          SizeConfig
                                                              .textMultiplier,
                                                      letterSpacing: 1.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_down_outlined,
                                                    size: 5.12 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 1.21 *
                                                        SizeConfig
                                                            .widthMultiplier,
                                                  ),
                                                  Text(
                                                    globals.truckType[index]
                                                        .truckUnloadingPoint,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff727272),
                                                        fontSize: 2.19 *
                                                            SizeConfig
                                                                .heightMultiplier),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.46 * SizeConfig.heightMultiplier,
                                  )
                                ],
                              );
                            },
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ButtonTheme(
                          minWidth: 87.5 * SizeConfig.widthMultiplier,
                          height: 18.82 * SizeConfig.heightMultiplier,
                          child: RaisedButton(
                            onPressed: () {
                              if (globals.truckType.isNotEmpty) {
                                AdditionalDataService.createOrder(
                                        widget.orderdata)
                                    .then((response) {
                                  if (response.statusCode == 200) {
                                    _showModalButtomSheetSuccess(context);
                                  } else {
                                    print('Sorry your data in not submitted');
                                  }
                                  globals.truckType.clear();
                                });
                              } else {
                                _showMessageDialoge(context);
                              }
                            },
                            child: Text('Place Order',
                                style: TextStyle(
                                    fontSize:
                                        2.92 * SizeConfig.textMultiplier)),
                            color: ColorConfig.themeColour,
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
        floatingActionButton: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 2.92 * SizeConfig.widthMultiplier,
              13.17 * SizeConfig.heightMultiplier),
          width: 16.59 * SizeConfig.widthMultiplier,
          height: 8.78 * SizeConfig.heightMultiplier,
          child: FloatingActionButton(
              elevation: 02,
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white70,
                        width: 0.14 * SizeConfig.widthMultiplier),
                    borderRadius: BorderRadius.circular(ficonrad),
                  ),
                  color: ColorConfig.themeColour,
                  child: Icon(
                    Icons.add,
                    size: 6.58 * SizeConfig.heightMultiplier,
                  )),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Order(
                              customerData: widget.customerData,
                              orderdata: widget.orderdata,
                            )));
              }),
        ),
      ),
    );
  }

  _showModalButtomSheetSuccess(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: 2.92 * SizeConfig.heightMultiplier,
                horizontal: 2.43 * SizeConfig.widthMultiplier),
            height: 65.88 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: ColorConfig.bagColour,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: ColorConfig.themeColour,
                  size: 21.96 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Request Successfull!',
                  style: TextStyle(
                    fontSize: 3.66 * SizeConfig.textMultiplier,
                    fontFamily: 'SecularOne',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.46 * SizeConfig.heightMultiplier,
                ),
                Center(
                  child: Text(
                    'Your request is successfully submitted for review',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 2.19 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 7.32 * SizeConfig.heightMultiplier,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard()));
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 2.34 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: ColorConfig.themeColour,
                  padding: EdgeInsets.symmetric(
                      vertical: 2.92 * SizeConfig.heightMultiplier,
                      horizontal: 12.16 * SizeConfig.widthMultiplier),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 5,
                  highlightElevation: 10,
                )
              ],
            ),
          );
        });
  }

  _showMessageDialoge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('No Trip !'),
            content: Text('There is no trip to submit'),
            actions: [
              FlatButton(
                  child: Text(
                    'ok',
                    style:
                        TextStyle(fontSize: 2.34 * SizeConfig.textMultiplier),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ));
}
