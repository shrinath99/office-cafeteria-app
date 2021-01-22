import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Dialogbox.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  // User loggedUser;

  String email;
  String password;

  bool runSpinner = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Log In',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ModalProgressHUD(
        inAsyncCall: runSpinner,
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 10),
          child: Form(
            key: _key,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.s,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 130,
                        width: 130,
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
                      keyboardType: TextInputType.emailAddress,
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

                        setState(() {
                          runSpinner = true;
                        });

                        try {
                          final currentUser1 =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (currentUser1 != null) {
                            Navigator.pushNamed(context, '/form');
                          }
                          setState(() {
                            runSpinner = false;
                          });
                        } on FirebaseAuthException catch (e) {
                          /*Container(
                                      child: Text(e.message),
                                    );
                                    print(e.message);*/
                          Navigator.pop(context);
                          dialogBox(context, e.message);
                        }

                        // Navigator.pushNamed(context, '/form');
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
        ),
      ),
    );
  }
}
