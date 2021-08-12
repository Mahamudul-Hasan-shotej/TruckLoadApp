import 'package:flutter/material.dart';

import 'package:truck_load_demo/ViewModel/DashboardTwo.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

import 'package:truck_load_demo/Views/Order/Global.dart' as globals;
import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';

class OrderModalButtom {
  showModalBottomSheetOrder(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.fromLTRB(
                2.43 * SizeConfig.widthMultiplier,
                7.32 * SizeConfig.heightMultiplier,
                2.43 * SizeConfig.widthMultiplier,
                0),
            height: 58.56 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: Color(0xffF7F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: FutureBuilder(
                future: AdditionalDataService.fetchDatatwo(globals.pk),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      DashBoardtwo datatwo = snapshot.data;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 31.2 * SizeConfig.widthMultiplier,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 2,
                                        child: FlatButton(
                                            child: Text(
                                              ' Order \n Placed',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 2.04 *
                                                      SizeConfig
                                                          .textMultiplier),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.32 *
                                                    SizeConfig.heightMultiplier,
                                                horizontal: 2.43 *
                                                    SizeConfig.widthMultiplier),
                                            onPressed: () {}),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            9.73 * SizeConfig.widthMultiplier,
                                        height:
                                            5.85 * SizeConfig.heightMultiplier,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            datatwo.data[0].value,
                                            style: TextStyle(
                                                fontSize: 2.92 *
                                                    SizeConfig.textMultiplier,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: SizeConfig.screenWidth / 3.22,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 02,
                                    child: FlatButton(
                                        child: Text(
                                          'Details\n'
                                          'Collected',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 2.04 *
                                                  SizeConfig.textMultiplier),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7.32 *
                                                SizeConfig.heightMultiplier,
                                            horizontal: 2.43 *
                                                SizeConfig.widthMultiplier),
                                        onPressed: () {}),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 31.24 * SizeConfig.widthMultiplier,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 2,
                                        child: FlatButton(
                                            child: Text(
                                              'Order\nConfirmed',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 2.04 *
                                                      SizeConfig
                                                          .textMultiplier),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.32 *
                                                    SizeConfig.heightMultiplier,
                                                horizontal: 2.43 *
                                                    SizeConfig.widthMultiplier),
                                            onPressed: () {}),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            9.73 * SizeConfig.widthMultiplier,
                                        height:
                                            5.85 * SizeConfig.heightMultiplier,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            datatwo.data[2].value,
                                            style: TextStyle(
                                                fontSize: 2.92 *
                                                    SizeConfig.textMultiplier,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.46 * SizeConfig.heightMultiplier,
                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 31.25 * SizeConfig.widthMultiplier,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 2,
                                        child: FlatButton(
                                            child: Text(
                                              'In\nTransit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 2.04 *
                                                      SizeConfig
                                                          .textMultiplier),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.32 *
                                                    SizeConfig.heightMultiplier,
                                                horizontal: 4.86 *
                                                    SizeConfig.widthMultiplier),
                                            onPressed: () {}),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            9.73 * SizeConfig.widthMultiplier,
                                        height:
                                            5.85 * SizeConfig.heightMultiplier,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            datatwo.data[3].value,
                                            style: TextStyle(
                                                fontSize: 2.92 *
                                                    SizeConfig.textMultiplier,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 62.49 * SizeConfig.widthMultiplier,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 2,
                                    child: FlatButton(
                                        child: Text(
                                          'Consignment\nDone',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 2.04 *
                                                  SizeConfig.textMultiplier),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7.32 *
                                                SizeConfig.heightMultiplier,
                                            horizontal: 4.86 *
                                                SizeConfig.widthMultiplier),
                                        onPressed: () {}),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          );
        });
  }
}
