import 'package:apnatiffin/Fooditems.dart';
import 'package:apnatiffin/Form.dart';
import 'package:apnatiffin/Login.dart';
import 'package:apnatiffin/OrderPage.dart';
import 'package:apnatiffin/Registration.dart';
import 'package:apnatiffin/WelcomePage.dart';
//import 'package:apnatiffin/PreviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Hachi Maru Pop',
        // textTheme: TextTheme(headline1:robotoMono()),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/form': (context) => FormHome(),
        '/fooditems': (context) => FoodList(),
        '/orderpage': (context) => OrderPage(),
        '/payment': (context) => PaymentScreen(),

        //'/previewscreen': (context) => Preview(),
      },
    );
  }
}
