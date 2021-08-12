import 'dart:io';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import '../Order/Global.dart' as globals;
import 'package:image_picker/image_picker.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

import '../Dashboard/Dashboard.dart';

class Profile extends StatefulWidget {
  final CustomerInfodata customerData;
  Profile({this.customerData});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  var bagRad = (11.71 * SizeConfig.heightMultiplier).round();
  var frontRad = (10.24 * SizeConfig.heightMultiplier).round();
  double bagRadious;
  double frontRadious;
  File tmpFile;
  File file;
  File imageUploasd;
  Img.Image resized_img;
  File image;
  @override
  void initState() {
    bagRadious = bagRad.toDouble();
    frontRadious = frontRad.toDouble();
    super.initState();
    download();
  }

  Widget buttomSheet() {
    return Container(
      height: 21.9 * SizeConfig.heightMultiplier,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 2.92 * SizeConfig.heightMultiplier,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 2.92 * SizeConfig.textMultiplier),
          ),
          SizedBox(
            height: 2.92 * SizeConfig.heightMultiplier,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                label: Text('Camera'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 8.78 * SizeConfig.heightMultiplier,
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.92 * SizeConfig.textMultiplier,
                ),
              ),
              backgroundColor: ColorConfig.themeColour,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () {
                  globals.bottomNavIndex = 0;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                color: Colors.white,
              ),
            ),
            backgroundColor: ColorConfig.bagColour,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1.46 * SizeConfig.heightMultiplier,
                    horizontal: 2.43 * SizeConfig.widthMultiplier),
                child: widget.customerData.data.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text('Invalid Customer')),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: bagRadious,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: frontRadious,
                                  backgroundImage: globals.imageUrl == null
                                      ? AssetImage("images/profile.png")
                                      : NetworkImage(globals.imageUrl),
                                  backgroundColor: Colors.black54,
                                ),
                              ),
                              Positioned(
                                bottom: 2.92 * SizeConfig.heightMultiplier,
                                right: 4.86 * SizeConfig.widthMultiplier,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (builder) => buttomSheet());
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.teal,
                                    size: 4.09 * SizeConfig.heightMultiplier,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 0.73 * SizeConfig.heightMultiplier,
                          ),
                          Center(
                              child: Text(
                            widget.customerData.data[0].name,
                            style: TextStyle(
                                fontSize: 4.39 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            widget.customerData.data[0].type,
                            style: TextStyle(
                                fontSize: 2.19 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.normal),
                          )),
                          SizedBox(
                            height: 2.92 * SizeConfig.heightMultiplier,
                          ),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 2,
                              child: Container(
                                  height: 11.71 * SizeConfig.heightMultiplier,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          2.92 * SizeConfig.heightMultiplier,
                                      horizontal:
                                          7.29 * SizeConfig.widthMultiplier),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email Address',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              2.19 * SizeConfig.textMultiplier,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.customerData.data[0].email,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2.63 *
                                                  SizeConfig.textMultiplier,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 2,
                              child: Container(
                                  height: 11.71 * SizeConfig.heightMultiplier,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          2.92 * SizeConfig.heightMultiplier,
                                      horizontal:
                                          7.29 * SizeConfig.widthMultiplier),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              2.19 * SizeConfig.textMultiplier,
                                        ),
                                      ),
                                      Text(
                                        widget.customerData.data[0].phone,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 2.63 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 2,
                              child: Container(
                                  height: 11.71 * SizeConfig.heightMultiplier,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          2.92 * SizeConfig.heightMultiplier,
                                      horizontal:
                                          7.29 * SizeConfig.widthMultiplier),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer ID',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              2.19 * SizeConfig.textMultiplier,
                                        ),
                                      ),
                                      Text(
                                        widget.customerData.data[0].customerId,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 2.63 *
                                                SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
              ),
            )));
  }

  void takephoto(ImageSource source) async {
    final pickfile = await _picker.getImage(
      source: source,
    );
    Directory tempDir = await getTemporaryDirectory();
    //var bytes = await rootBundle.load('assets\images\profile.png');

    String tempPath = tempDir.path;
    file = File('$tempPath/profile.png');

    //file = File('$tempPath/profile.png');
    tmpFile = File(pickfile.path);
    Img.Image imagetemp = Img.decodeImage(tmpFile.readAsBytesSync());
    resized_img = Img.copyResize(imagetemp, width: 120);

    file.writeAsBytesSync(encodePng(resized_img));
    upload();
  }

  void upload() async {
    final key =
        "${widget.customerData.data[0].customerId}/Pictures/${widget.customerData.data[0].pictureName}";
    await Amplify.Storage.uploadFile(key: key, local: file);
    download();
  }

  void download() async {
    try {
      print('In getUrl');
      String key =
          '${widget.customerData.data[0].customerId}/Pictures/${widget.customerData.data[0].pictureName}';
      S3GetUrlOptions options = S3GetUrlOptions(
          accessLevel: StorageAccessLevel.guest, expires: 10000);
      GetUrlResult result =
          await Amplify.Storage.getUrl(key: key, options: options);

      print(result);
      setState(() {
        globals.imageUrl = result.url;
      });
    } catch (e) {
      print('GetUrl Err: ' + e.toString());
    }
  }
}
