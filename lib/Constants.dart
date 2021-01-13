import 'package:flutter/material.dart';

const kTextFieldDecorator = InputDecoration(
//errorBorder: ,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
