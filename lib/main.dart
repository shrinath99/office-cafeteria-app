import 'package:apnatiffin/Form.dart';
import 'package:apnatiffin/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        // textTheme: TextTheme(headline1:robotoMono()),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FormHome(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
