import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

import 'package:truck_load_demo/Views/OrderInfo/OrderDetails.dart';
import 'package:truck_load_demo/Views/OrderInfo/LockSccreen1.dart';
import 'package:truck_load_demo/Views/OrderInfo/VsCamera.dart';
import 'package:truck_load_demo/Views/OrderInfo/VsMap.dart';

class LockScreen extends StatefulWidget {
  final String pk;
  final int length;
  LockScreen({this.pk, this.length});
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final textList = ['Smart Lock', 'VS Camera', 'VTS & Maps'];
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
            'IOT Devices',
            style: TextStyle(
              color: Colors.white,
              fontSize: 2.50 * SizeConfig.textMultiplier,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetails(
                            pk: widget.pk,
                            length: widget.length,
                          )));
            },
            color: Colors.white,
          ),
        ),
        body: Container(
            color: ColorConfig.bagColour,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: globals.buttomNavIot == 0
                ? LockScreen1()
                : globals.buttomNavIot == 1
                    ? VsCamera()
                    : VsMap()),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: textList.length,
          height: 10.03 * SizeConfig.heightMultiplier,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? ColorConfig.themeColour : Color(0xffbdbdbd);

            return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textList[index],
                    style: TextStyle(
                        fontSize: 1.78 * SizeConfig.textMultiplier,
                        color: color,
                        fontWeight: FontWeight.bold),
                  )
                ]);
          },
          activeIndex: globals.buttomNavIot,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              globals.buttomNavIot = index;
            });
          },
        ),
      ),
    );
  }
}
