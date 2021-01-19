import 'package:flutter/material.dart';

Future<void> dialogBox(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Text('Upload ID card'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              // BorderRadius.circular(20),
              // Image.asset('images/alert.jpg')
              //Text('This is a demo alert dialog.'),
              //Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            child: Text('Okay'),
            color: Colors.yellow,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
