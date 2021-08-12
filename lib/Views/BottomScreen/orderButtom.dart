import 'package:flutter/material.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';

class OrderButtom extends StatefulWidget {
  final DashBoardOne dashBoardOne;
  OrderButtom({this.dashBoardOne});
  @override
  _OrderButtomState createState() => _OrderButtomState();
}

class _OrderButtomState extends State<OrderButtom> {
  @override
  Widget build(BuildContext context) {
    return showModalBottomSheetOrder(context);
  }

  showModalBottomSheetOrder(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 500,
            decoration: BoxDecoration(
              color: Color(0xffEAFFEE),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 130,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              elevation: 20,
                              child: FlatButton(
                                  child: Text(
                                    ' Order \n Placed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 10),
                                  splashColor: Colors.green,
                                  onPressed: () {}),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 20,
                          child: FlatButton(
                              child: Text(
                                'Details\n'
                                'Collected',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 10),
                              splashColor: Colors.green,
                              onPressed: () {}),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 130,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              elevation: 20,
                              child: FlatButton(
                                  child: Text(
                                    'Order\nConfirmed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 10),
                                  splashColor: Colors.green,
                                  onPressed: () {}),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 130,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              elevation: 20,
                              child: FlatButton(
                                  child: Text(
                                    'In\nTransit',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 20),
                                  splashColor: Colors.green,
                                  onPressed: () {}),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 260,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 20,
                          child: FlatButton(
                              child: Text(
                                'Consignment\nDone',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 20),
                              splashColor: Colors.green,
                              onPressed: () {}),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
