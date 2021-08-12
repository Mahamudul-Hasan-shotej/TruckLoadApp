import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VsCamera extends StatefulWidget {
  @override
  _VsCameraState createState() => _VsCameraState();
}

class _VsCameraState extends State<VsCamera> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConfig.bagColour,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Unavailable Right Now !',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
