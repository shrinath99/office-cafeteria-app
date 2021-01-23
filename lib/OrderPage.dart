import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  String title;
  String price;
  Image image;
  int id;

  OrderPage({this.title, this.price, this.image, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Your Order',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                //tag: 'menuphoto',
                tag: "avatar_" + id.toString(),
                child: Container(
                  child: image,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                },
                label: Text('Order now'),
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
