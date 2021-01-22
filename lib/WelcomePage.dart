//import 'package:apnatiffin/Registration.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();

    //getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                ),
                Row(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 80,
                        width: 80,
                        child: Image.asset('images/tiffinlogo.png'),
                      ),
                    ),
                    Text(
                      'Apna Tiffin',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  label: Text('Log In'),
                  splashColor: Colors.black,
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.yellow,
                  label: Text('Register'),
                  foregroundColor: Colors.black,
                  splashColor: Colors.black,
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, '/registration');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
