import 'package:flutter/material.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/ViewModel/OrderFormData.dart';
import 'package:truck_load_demo/Models/modelData/Color.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:intl/intl.dart';
import 'package:truck_load_demo/Views/Dashboard/Dashboard.dart';
import 'dart:async';
import 'Global.dart' as globals;
import 'package:flutter/services.dart';

import 'package:truck_load_demo/Views/Order/ListOfOrder.dart';

class Order extends StatefulWidget {
  final CustomerInfodata customerData;
  final Orderformdata orderdata;
  Order({
    this.customerData,
    this.orderdata,
  });
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // Variables
//  DateTime _ordate;
  DateTime _lndate;
  //DateTime _strdate;
  String _loadingPoint;
  String _unloadingPoint;
  String _vehicleType;
  String _vehicleLength;
  String _vehicleWeight;
  int _vehicleQuantity;
//  String _truckFare;
  // String _driverName;
  DateTime _pickDate;

  //form list
  List<String> lengthCover = [
    '7ft',
    '9ft',
    '12ft',
    '16ft',
    '23ft',
  ];
  List<String> lengthOpen = [
    '7ft',
    '9ft',
    '12ft',
    '14ft',
    '18ft',
    '20ft',
  ];

  List<String> type = [
    'Covered',
    'Open',
  ];
  List<TruckType> truckType = [];
  //controllers
  // final _ordateController = TextEditingController();
  final _loadingController = TextEditingController();
  // final _strdateController = TextEditingController();
  final lengtnController = TextEditingController();
  final typeController = TextEditingController();
  final weightController = TextEditingController();
  final _scrollController = ScrollController();
  //Model Intances
  Orderformdata orderdata = Orderformdata();

  CustomerInfodata customerInfodata = CustomerInfodata();
  //FORM KEY
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //INIT STATE
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickDate = DateTime.now();
  }

  //Date Picker Fuctions
  /* Future<Null> _selectDateOne(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green),
            child: child,
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        print(_pickDate);

        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        //var date =
        //   "${_pickDate.toLocal().year}-${_pickDate.toLocal().month}-${_pickDate.toLocal().day}";
        _ordateController.text = formattedDate;
      });
    }
  }
*/
  Future<Null> _selectDateTwo(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Theme(
                data: ThemeData(
                    primarySwatch: Colors.green,
                    primaryColor: Colors.green,
                    accentColor: Colors.green),
                child: Container(
                  height: 87.84 * SizeConfig.heightMultiplier,
                  width: 170.31 * SizeConfig.widthMultiplier,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        _loadingController.text = formattedDate;
      });
    }
  }

  /* Future<Null> _selectDateThree(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green),
            child: child,
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        _strdateController.text = formattedDate;
      });
    }
  }
*/
  // Field Fuctions widgets
  /* Widget _buildOrdate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateOne(context),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                onTap: () {
                  _selectDateOne(context);
                },
                controller: _ordateController,
                keyboardType: TextInputType.datetime,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 2),
                    hintText: "Select date",
                    suffix: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today),
                      iconSize: 15,
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _ordate = DateTime.parse((value));
                },
                onChanged: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _buildLndate() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loading date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateTwo(context),
              child: Container(
                height: 6.27 * SizeConfig.heightMultiplier,
                child: TextFormField(
                  showCursor: true,
                  readOnly: true,
                  style: TextStyle(
                      fontSize: 2.00 * SizeConfig.textMultiplier,
                      height: 0.25 * SizeConfig.heightMultiplier,
                      color: Colors.black),
                  onTap: () {
                    _selectDateTwo(context);
                  },
                  controller: _loadingController,
                  keyboardType: TextInputType.datetime,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(
                          4.86 * SizeConfig.widthMultiplier,
                          0,
                          1.21 * SizeConfig.widthMultiplier,
                          0.29 * SizeConfig.heightMultiplier),
                      hintText: "Select Date",
                      suffix: IconButton(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, 2.19 * SizeConfig.heightMultiplier),
                        onPressed: () {
                          setState(() {
                            _selectDateTwo(context);
                          });
                        },
                        icon: Icon(Icons.calendar_today),
                        iconSize: 2.19 * SizeConfig.heightMultiplier,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Date is required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _lndate = DateTime.parse(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Widget _buildStrdate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Starting date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateThree(context),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                onTap: () {
                  _selectDateThree(context);
                },
                controller: _strdateController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 2),
                    hintText: "Select Date",
                    suffix: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      onPressed: () {
                        setState(() {
                          _selectDateThree(context);
                        });
                      },
                      icon: Icon(Icons.calendar_today),
                      splashColor: Colors.green,
                      iconSize: 15,
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _strdate = DateTime.parse(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _buildLodingPoint() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loading point',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 6.27 * SizeConfig.heightMultiplier,
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(
                    fontSize: 2.00 * SizeConfig.textMultiplier,
                    height: 0.25 * SizeConfig.heightMultiplier,
                    color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.73 * SizeConfig.heightMultiplier,
                        horizontal: 4.86 * SizeConfig.widthMultiplier),
                    hoverColor: Colors.black,
                    hintText: "Enter loading point"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Loading point is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _loadingPoint = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnLodingPoint() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Unloading point',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 6.27 * SizeConfig.heightMultiplier,
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(
                    fontSize: 2.00 * SizeConfig.textMultiplier,
                    height: 0.25 * SizeConfig.heightMultiplier,
                    color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.73 * SizeConfig.heightMultiplier,
                        horizontal: 4.86 * SizeConfig.widthMultiplier),
                    hoverColor: Colors.black,
                    hintText: "Enter Unloading point"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Loading point is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _unloadingPoint = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVtype() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                height: 6.27 * SizeConfig.heightMultiplier,
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    style: TextStyle(
                        fontSize: 1.88 * SizeConfig.textMultiplier,
                        color: Colors.black),
                    underline: Container(color: Colors.transparent),
                    items: type.map((String dropDownItems) {
                      return DropdownMenuItem<String>(
                        value: dropDownItems,
                        child: Text(dropDownItems),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._vehicleType = newValueSelected;
                        _vehicleLength = null;
                        if (_vehicleType == 'Covered') {
                          lengthCover = [
                            '7ft',
                            '9ft',
                            '12ft',
                            '16ft',
                            '23ft',
                          ];
                        } else if (_vehicleType == 'Open') {
                          lengthCover = [
                            '7ft',
                            '9ft',
                            '12ft',
                            '14ft',
                            '18ft',
                            '20ft',
                          ];
                        }
                      });
                    },
                    value: _vehicleType,
                    isExpanded: true,
                    dropdownColor: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildVlength() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle length',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 6.27 * SizeConfig.heightMultiplier,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  style: TextStyle(
                      fontSize: 1.88 * SizeConfig.textMultiplier,
                      color: Colors.black),
                  underline: Container(color: Colors.transparent),
                  value: _vehicleLength,
                  items: lengthCover.map((String dropDownItems) {
                    return DropdownMenuItem<String>(
                      value: dropDownItems,
                      child: Text(dropDownItems),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._vehicleLength = newValueSelected;
                      if (_vehicleType == 'Covered' &&
                          _vehicleLength == '7ft') {
                        weightController.text = '1.5 ton';
                      } else if (_vehicleType == 'Covered' &&
                          _vehicleLength == '9ft') {
                        weightController.text = '2.5 ton';
                      } else if (_vehicleType == 'Covered' &&
                          _vehicleLength == '12ft') {
                        weightController.text = '4 ton';
                      } else if (_vehicleType == 'Covered' &&
                          _vehicleLength == '16ft') {
                        weightController.text = '10 ton';
                      } else if (_vehicleType == 'Covered' &&
                          _vehicleLength == '23ft') {
                        weightController.text = '12.5 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '7ft') {
                        weightController.text = '1.5 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '9ft') {
                        weightController.text = '3 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '12ft') {
                        weightController.text = '6 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '14ft') {
                        weightController.text = '8 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '18ft') {
                        weightController.text = '13 ton';
                      } else if (_vehicleType == 'Open' &&
                          _vehicleLength == '20ft') {
                        weightController.text = '15 ton';
                      }
                    });
                  },
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVweight() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 6.27 * SizeConfig.heightMultiplier,
              child: TextFormField(
                style: TextStyle(
                    fontSize: 2.00 * SizeConfig.textMultiplier,
                    height: 0.25 * SizeConfig.heightMultiplier,
                    color: Colors.black),
                controller: weightController,
                enabled: false,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.73 * SizeConfig.heightMultiplier,
                        horizontal: 4.86 * SizeConfig.widthMultiplier),
                    hoverColor: Colors.black,
                    hintText: "Depends on Length"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Vehicle weight is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _vehicleWeight = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVquantity() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.43 * SizeConfig.widthMultiplier,
          vertical: 0.73 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle quantity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.19 * SizeConfig.textMultiplier,
              )),
          Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 6.27 * SizeConfig.heightMultiplier,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 2.00 * SizeConfig.textMultiplier,
                    height: 0.25 * SizeConfig.heightMultiplier,
                    color: Colors.black),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 3,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0.73 * SizeConfig.heightMultiplier,
                      horizontal: 4.86 * SizeConfig.widthMultiplier),
                  hoverColor: Colors.black,
                  hintText: "Enter vehicle quantity",
                  counterText: "",
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Vehicle quantity is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _vehicleQuantity = int.parse(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Widget _buildtruckfare() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Truck fare',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter Truck Fare"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Truck is required';
                }
                return null;
              },
              onSaved: (String value) {
                _truckFare = value;
              },
            ),
          ),
        ],
      ),
    );
  }
*/
  /*Widget _buildDriverName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Driver Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter driver name"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Driver name is required';
                }
                return null;
              },
              onSaved: (String value) {
                _driverName = value;
              },
            ),
          ),
        ],
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff707070),
        body: SafeArea(
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            color: Color(0xffF7F5F5),
            margin: EdgeInsets.symmetric(
                vertical: 2.92 * SizeConfig.heightMultiplier,
                horizontal: 4.86 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.46 * SizeConfig.heightMultiplier,
                      horizontal: 2.43 * SizeConfig.widthMultiplier,
                    ),
                    child: Center(
                      child: Text(
                        'Add New Trip',
                        style: TextStyle(
                            fontSize: 2.92 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    height: 73.2 * SizeConfig.heightMultiplier,
                    margin: EdgeInsets.fromLTRB(
                        2.43 * SizeConfig.widthMultiplier,
                        0,
                        2.43 * SizeConfig.widthMultiplier,
                        0),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Form(
                          key: _formKey,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              // _buildOrdate(),
                              _buildLndate(),
                              // _buildStrdate(),
                              _buildLodingPoint(),
                              _buildUnLodingPoint(),
                              _buildVtype(),
                              _buildVlength(),
                              _buildVweight(),
                              _buildVquantity(),
                              // _buildtruckfare(),
                              // _buildDriverName(),
                              SizedBox(
                                height: 29.2 * SizeConfig.heightMultiplier,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            4.86 * SizeConfig.widthMultiplier,
                            0,
                            4.86 * SizeConfig.widthMultiplier,
                            1.46 * SizeConfig.heightMultiplier),
                        child: Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        2.92 * SizeConfig.heightMultiplier),
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
                                },
                                color: Colors.red,
                                textColor: Colors.white,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize:
                                          2.34 * SizeConfig.textMultiplier),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.43 * SizeConfig.widthMultiplier,
                            ),
                            Expanded(
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        2.92 * SizeConfig.heightMultiplier),
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  } else {
                                    _formKey.currentState.save();
                                    truckAdd();
                                    _showMessageDialoge(context);
                                    //clear();
                                  }
                                },
                                color: ColorConfig.themeColour,
                                textColor: Colors.white,
                                child: Text(
                                  'Add to list',
                                  style: TextStyle(
                                      fontSize:
                                          2.34 * SizeConfig.textMultiplier),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        /* bottomSheet: Padding(
            padding: EdgeInsets.all(40.0),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    onPressed: () {
                      truckAdd();
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      } else {
                        _formKey.currentState.save();
                        truckAdd();
                        _showMessageDialoge(context);
                        // clear();
                      }
                    },
                    color: Color(0xff1BBDB8),
                    textColor: Colors.white,
                    child: Text(
                      'Add to list',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
          
          */
      ),
    );
  }

  _showMessageDialoge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Truck added',
              style: TextStyle(fontSize: 2.63 * SizeConfig.textMultiplier),
            ),
            content: Text(
              'One trip is added to the list',
              style: TextStyle(fontSize: 1.97 * SizeConfig.textMultiplier),
            ),
            actions: [
              FlatButton(
                  child: Text(
                    'ok',
                    style: TextStyle(
                        fontSize: 2.34 * SizeConfig.textMultiplier,
                        color: ColorConfig.themeColour),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfOrder(
                            customerData: widget.customerData,
                            orderdata: orderdata,
                          ),
                        ));
                  })
            ],
          ));

  void truckAdd() {
    orderdata.createdDate = _lndate;
    orderdata.customerId = widget.customerData.data[0].customerId;
    orderdata.customerType = widget.customerData.data[0].type;
    orderdata.email = widget.customerData.data[0].email;
    orderdata.name = widget.customerData.data[0].name;
    orderdata.numberOfConsignment = '1';
    orderdata.createdDate = _lndate;
    orderdata.orderDate = _pickDate;
    orderdata.orderId = '1612775053612_tstj_order';
    orderdata.orientation = "order";
    orderdata.phone = widget.customerData.data[0].phone;
    orderdata.pk = widget.customerData.data[0].pk;
    orderdata.previousStatus = 'ordersPlaced';
    orderdata.sk = widget.customerData.data[0].sk;
    orderdata.status = 'ordersPlaced';
    orderdata.updatedBy = widget.customerData.data[0].email;

    var ki = TruckType(
      cbm: '32',
      driverName: "",
      length: _vehicleLength,
      quantity: _vehicleQuantity,
      truckFare: "",
      truckLoadingDate: _lndate,
      truckLoadingPoint: _loadingPoint,
      truckStartingDate: _lndate,
      truckUnloadingPoint: _unloadingPoint,
      type: _vehicleType,
      weight: _vehicleWeight,
    );
    globals.truckType.add(ki);
    orderdata.truckType = globals.truckType;
  }
}
