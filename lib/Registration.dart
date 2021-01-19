import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30, left: 10),
        child: Form(
          key: _key,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  cursorHeight: 30,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecorator.copyWith(
                    hintText: 'Enter your email',

                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    //labelText: 'Email',
                  ),
                  validator: (val) => !EmailValidator.validate(val, true)
                      ? 'Not a valid email.'
                      : null,
                  onSaved: (String value) {
                    email = value;
                    print(email);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  cursorHeight: 30,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,

                  decoration: kTextFieldDecorator.copyWith(
                    hintText: 'Enter your password',
                    icon: Icon(Icons.lock, color: Colors.black),
                    //labelText: 'Email',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Can\'t be empty';
                    } else if (value.length < 6) {
                      return 'required 6 charactes';
                    }
                  },

                  onSaved: (String value) {
                    password = value;
                    print(password);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () async {
                    if (!_key.currentState.validate()) {
                      // _validate = true;
                      return;
                    }
                    _key.currentState.save();
                    //Navigator.pushNamed(context, '/login');

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, '/login');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  label: Text('Submit'),
                  //tooltip: 'Pick Image',
                  icon: Icon(
                    Icons.send,
                    size: 30,
                  ),
                  backgroundColor: Colors.yellow,
                  splashColor: Colors.black,
                  foregroundColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
