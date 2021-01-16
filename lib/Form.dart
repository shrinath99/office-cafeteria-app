import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
import 'package:image_picker/image_picker.dart';

import 'PreviewScreen.dart';

class FormHome extends StatefulWidget {
  @override
  _FormHomeState createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  File _image;
  final picker = ImagePicker();
  //final _key = GlobalKey<FormState>();

  String _name;
  String _organisationName;
  String _id;
  String _mobileNo;
  String _email;

  // ignore: non_constant_identifier_names
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  //const String email = _textValue.value;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff ffff9f),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          'Apna tiffin',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _key,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/tiffinlogo.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //Container(),
                  SizedBox(
                    height: 10,
                  ),

                  //: EdgeInsets.only(right: 10),
                  TextFormField(
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    style: TextStyle(
                      fontSize: 20,
                    ), //GoogleFonts.robotoMono(),
                    textAlign: TextAlign.center,

                    decoration: kTextFieldDecorator.copyWith(
                      // errorText: _validate ? 'Can\'t be empty' : null,
                      //labelText: 'Full Name',
                      //alignLabelWithHint: false,

                      /*  labelStyle: TextStyle(
                          //textBaseline: TextBaseline.

                          color: Colors.black,
                        ),*/
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 30,
                      ),
                      hintText: 'Your full name',
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your name';
                      }
                    },
                    onSaved: (String value) {
                      _name = value;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecorator.copyWith(
                      //  errorText: _validate ? 'Can\'t be empty' : null,
                      icon: Icon(
                        Icons.work,
                        color: Colors.black,
                        size: 30,
                      ),
                      hintText: 'Organisation Name',
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      // ignore: missing_return
                      if (value.isEmpty) {
                        return 'Enter organisation name';
                      }
                    },
                    onSaved: (String value) {
                      _organisationName = value;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecorator.copyWith(
                      //errorText: _validate ? 'Can\'t be empty' : null,
                      icon: Icon(
                        Icons.perm_identity,
                        color: Colors.black,
                        size: 30,
                      ),
                      hintText: 'Employee ID',
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      // ignore: missing_return
                      if (value.isEmpty) {
                        return 'Enter employee id';
                      }
                    },
                    onSaved: (String value) {
                      _id = value;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: kTextFieldDecorator.copyWith(
                      //errorText: _validate ? 'Can\'t be empty' : null,
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.black,
                        size: 30,
                      ),
                      hintText: 'Mobile No',
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),

                    // ignore: missing_return
                    validator: (String value) {
                      // ignore: missing_return
                      if (value.isEmpty) {
                        return 'Enter Mobile No';
                      } else if (value.length < 10 || value.length > 10) {
                        return 'Enter valid digits';
                      }
                    },
                    onSaved: (String value) {
                      _mobileNo = value;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecorator.copyWith(
                      // errorText: _validate ? 'Can\'t be empty' : null,
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 30,
                      ),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    validator: (val) => !EmailValidator.validate(val, true)
                        ? 'Not a valid email.'
                        : null,
                    onSaved: (String value) {
                      _email = value;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: getImage,
                    label: Text('Upload Id Card'),
                    //tooltip: 'Pick Image',
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30,
                    ),
                    backgroundColor: Colors.yellow,
                    splashColor: Colors.black,
                    foregroundColor: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: _image == null
                        ? Text('ID Card Not Selected.')
                        : Text('ID Card uploaded'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //data: Theme.of(context).copyWith(textTheme: TextTheme(headline1: ) ),
                  FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () {
                      //todo
                      if (!_key.currentState.validate()) {
                        // _validate = true;
                        return;
                      }
                      _key.currentState.save();
                      print(_name);
                      print(_organisationName);
                      print(_id);
                      print(_mobileNo);
                      print(_email);

                      // Navigator.pushNamed(context, '/previewscreen');
                      //Navigator.push(context, MaterialPageRoute(builder: => Preview(),),);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Preview(
                                name: _name,
                                organisationName: _organisationName,
                                empId: _id,
                                mobileNo: _mobileNo,
                                email: _email,
                                idImage: _image);
                          },
                        ),
                      );

                      setState(() {});
                    },

                    backgroundColor: Colors.yellow,
                    label: Text(
                      'Preview',
                    ),
                    //hoverElevation: 30,

                    // style: TextStyle(Colors.black)),
                    splashColor: Colors.black,

                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 30,
                    ),
                    foregroundColor: Colors.black,
                    //shape: ContinuousRectangleBorder(),
                  ),
                  /*SizedBox(
                      height: 10,
                    ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
