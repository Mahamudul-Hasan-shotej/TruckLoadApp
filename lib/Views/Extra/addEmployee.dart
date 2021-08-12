import 'package:flutter/material.dart';
import 'package:truck_load_demo/Views/Dashboard/Dashboard.dart';

class AddEmplyee extends StatefulWidget {
  @override
  _AddEmplyeeState createState() => _AddEmplyeeState();
}

class _AddEmplyeeState extends State<AddEmplyee> {
  String _emplyeename;
  String _emplyeePhoneNo;
  String _empplyeeEmail;
  String _emplyeePass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEname() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employee Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
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
                  hintText: "Md Mahudul Hasan"),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
              onSaved: (String value) {
                _emplyeename = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEphoneNo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employee Phone No:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "01926374667"),
              validator: (String value) {
                if (value.isEmpty) {
                  return "PhoneNo is required";
                }
                return null;
              },
              onSaved: (String value) {
                _emplyeePhoneNo = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEemail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employee Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Shootej@gmail.com"),
              // ignore: missing_return
              validator: (String value) {
                if (value.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
              onSaved: (String value) {
                _empplyeeEmail = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpass() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employee password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "*******"),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
              onSaved: (String value) {
                _emplyeePass = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEAFFEE),
        appBar: AppBar(
          title: Text(
            'Employee Info',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            color: Colors.green,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildEname(),
                      _buildEphoneNo(),
                      _buildEemail(),
                      _buildEpass(),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_emplyeename);
                          print(_emplyeePhoneNo);
                          print(_empplyeeEmail);
                          print(_emplyeePass);
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
