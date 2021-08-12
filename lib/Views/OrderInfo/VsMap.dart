import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

class VsMap extends StatefulWidget {
  @override
  _VsMapState createState() => _VsMapState();
}

class _VsMapState extends State<VsMap> {
  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.8540299172, 90.415498338),
    zoom: 14,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConfig.bagColour,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: GoogleMap(
          initialCameraPosition: cameraPosition,
          mapType: MapType.normal,
        ));
  }
}
