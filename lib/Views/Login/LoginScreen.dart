// Amplify Flutter Packages
import 'dart:async';

import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_load_demo/Models/Amplify/AmplifyConfig.dart';
import 'package:truck_load_demo/ViewModel/EmailValidator.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Views/Dashboard/Dashboard.dart';
import '../Order/Global.dart' as globals;

//import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenOne extends StatefulWidget {
  @override
  _LoginScreenOneState createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  bool _isChecked = false;

  var bagRad = (14.6412 * SizeConfig.heightMultiplier).round();
  var frontRad = (13.177 * SizeConfig.heightMultiplier).round();
  double bagRadious;
  double frontRadious;
  String finalEmail;

  @override
  void initState() {
    bagRadious = bagRad.toDouble();
    frontRadious = frontRad.toDouble();

    // TODO: implement initState
    super.initState();
    configureAmplify();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  Future eraseValidationdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 20.49 * SizeConfig.heightMultiplier,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      color: ColorConfig.themeColour,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 3.50 * SizeConfig.heightMultiplier),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/backGround.jpg'),
                          radius: bagRadious,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            backgroundImage: AssetImage('images/logo.png'),
                            radius: frontRadious,
                          ),
                        ),
                      ),
                    ),

                    /* Container(
                      child: Positioned(
                        bottom: -11.71 * SizeConfig.heightMultiplier,
                        left: 24.76 * SizeConfig.widthMultiplier,
                        child: 
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(
                height: 7.32 * SizeConfig.heightMultiplier,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                color: Colors.transparent,
                child: Text(
                  'TruckLoad',
                  style: TextStyle(
                    fontFamily: 'SecularOne',
                    fontSize: 4.39 * SizeConfig.textMultiplier,
                    color: ColorConfig.themeColour,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 4.39 * SizeConfig.heightMultiplier,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 9.73 * SizeConfig.widthMultiplier),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 2.00 * SizeConfig.textMultiplier,
                            color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.92 * SizeConfig.heightMultiplier,
                              horizontal: 4.86 * SizeConfig.widthMultiplier),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 2.34 * SizeConfig.textMultiplier),
                          fillColor: Color(0xffF7F5F5),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: ColorConfig.themeColour,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            !validateEmail(value) ? "Email is Invalid" : null,
                      ),
                      SizedBox(
                        height: 1.46 * SizeConfig.heightMultiplier,
                      ),
                      TextFormField(
                        controller: _passController,
                        style: TextStyle(
                            fontSize: 2.00 * SizeConfig.textMultiplier,
                            color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.92 * SizeConfig.heightMultiplier,
                              horizontal: 4.86 * SizeConfig.widthMultiplier),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 2.34 * SizeConfig.textMultiplier),
                          fillColor: Color(0xffF7F5F5),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: ColorConfig.themeColour,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            value.isEmpty ? "Password is invalid" : null,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 0, horizontal: 7.29 * SizeConfig.widthMultiplier),
                child: Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        activeColor: ColorConfig.themeColour,
                        onChanged: (bool value) {
                          setState(() {
                            _isChecked = value;
                            if (value == true) {
                              getValidationData();
                            } else {
                              eraseValidationdata();
                            }
                          });
                        }),
                    Text(
                      'Remeber Me',
                      style:
                          TextStyle(fontSize: 2.34 * SizeConfig.textMultiplier),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.39 * SizeConfig.heightMultiplier,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 0, horizontal: 9.73 * SizeConfig.widthMultiplier),
                child: ButtonTheme(
                  height: 8.16 * SizeConfig.heightMultiplier,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_isChecked == true) {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();

                        sharedPreferences.setString(
                            'email', _emailController.text);
                      }
                      _loginButtonPressed(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 1.21 * SizeConfig.widthMultiplier,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 2.92 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    color: ColorConfig.themeColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    highlightElevation: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 2.92 * SizeConfig.heightMultiplier,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _loginButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text.trim();
      final password = _passController.text.trim();

      try {
        final signInResult =
            await Amplify.Auth.signIn(username: email, password: password);
        print(signInResult.isSignedIn);

        if (signInResult.isSignedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
        } else {
          print('Sine in unsuccessful');
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Sign in failed'),
                  content: Text('Email/Password is incorrect!'),
                  actions: [
                    FlatButton(
                        child: Text('ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ));
      }
    }
  }
}
