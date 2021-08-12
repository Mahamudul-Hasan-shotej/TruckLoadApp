import 'package:flutter/material.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Order/Order.dart';

import '../Dashboard/Dashboard.dart';

class AddOrder extends StatefulWidget {
  final CustomerInfodata customerData;
  AddOrder({this.customerData});
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
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
            margin: EdgeInsets.symmetric(
                vertical: 2.92 * SizeConfig.heightMultiplier,
                horizontal: 2.43 * SizeConfig.widthMultiplier),
            height: 43.92 * SizeConfig.heightMultiplier,
            width: 145.98 * SizeConfig.widthMultiplier,
            child: Center(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(05), // if you need this
                  side: BorderSide(
                    color: ColorConfig.themeColour,
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      3.64 * SizeConfig.widthMultiplier,
                      0,
                      2.43 * SizeConfig.widthMultiplier,
                      0),
                  color: Colors.white,
                  height: 36.6 * SizeConfig.heightMultiplier,
                  width: 85.15 * SizeConfig.widthMultiplier,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.85 * SizeConfig.heightMultiplier,
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 3.36 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2.92 * SizeConfig.heightMultiplier,
                      ),
                      Text(
                        'Firstly, you need to add trip by tapping the "Plus" icon below this screen. you can add more than one trip in a single order. Added orders will be listed in this screen.',
                        style: TextStyle(
                          fontSize: 2.48 * SizeConfig.textMultiplier,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 4.86 * SizeConfig.widthMultiplier,
              10.24 * SizeConfig.heightMultiplier),
          width: 16.59 * SizeConfig.widthMultiplier,
          height: 8.78 * SizeConfig.heightMultiplier,
          child: FloatingActionButton(
              elevation: 05,
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white70,
                        width: 0.24 * SizeConfig.widthMultiplier),
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
                        builder: (context) =>
                            Order(customerData: widget.customerData)));
              }),
        ),
      ),
    );
  }
}
