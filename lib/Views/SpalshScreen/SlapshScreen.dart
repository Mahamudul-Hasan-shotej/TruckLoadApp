import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_load_demo/Models/Amplify/AmplifyConfig.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Dashboard/Dashboard.dart';
import 'package:truck_load_demo/Views/Login/LoginScreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var bagRad = (14.6412 * SizeConfig.heightMultiplier).round();
  var frontRad = (13.177 * SizeConfig.heightMultiplier).round();
  String finalEmail;
  double bagRadious;

  double frontRadious;
  @override
  void initState() {
    bagRadious = bagRad.toDouble();
    frontRadious = frontRad.toDouble();
    configureAmplify();
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2), () {
        if (finalEmail == null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreenOne()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
        }
      });
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: ColorConfig.themeColour,
      child: Center(
        child: CircleAvatar(
          radius: bagRadious,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: frontRadious,
            backgroundImage: AssetImage('images/logo.png'),
          ),
        ),
      ),
    );
  }
}
