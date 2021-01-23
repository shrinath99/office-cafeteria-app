import 'package:apnatiffin/Dialogbox.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

enum paymentMode { credit, gpay, paytm }

class _PaymentScreenState extends State<PaymentScreen> {
  paymentMode mode = paymentMode.credit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Select mode of Payment',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text('Credit Card'),
                      leading: Radio(
                        activeColor: Colors.yellowAccent,
                        value: paymentMode.credit,
                        //focusColor: Colors.yellow,
                        groupValue: mode,
                        onChanged: (paymentMode value) {
                          setState(() {
                            mode = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Gpay'),
                      leading: Radio(
                        value: paymentMode.gpay,
                        // focusColor: Colors.yellow,
                        activeColor: Colors.yellowAccent,
                        groupValue: mode,
                        onChanged: (paymentMode value) {
                          setState(() {
                            mode = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Paytm'),
                      leading: Radio(
                        value: paymentMode.paytm,
                        //focusColor: Colors.yellow,
                        activeColor: Colors.yellowAccent,
                        groupValue: mode,
                        onChanged: (paymentMode value) {
                          setState(() {
                            mode = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  //Navigator.pushNamed(context, '/payment');
                  dialogBox(context, 'Order placed \n Thank You!!');
                },
                label: Text('Confirm'),
                splashColor: Colors.black,
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                icon: Icon(Icons.done_outline),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

/*
class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Select mode of Payment',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
