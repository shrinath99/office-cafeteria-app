import 'dart:io';
//import 'package:firebase_auth/firebase_auth.dart';

import 'Dialogbox.dart';
import 'package:apnatiffin/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class Preview extends StatelessWidget {
  Preview({
    @required this.name,
    @required this.organisationName,
    @required this.empId,
    @required this.mobileNo,
    @required this.email,
    @required this.idImage,
  });

  final String name;
  final String organisationName;
  final String empId;
  final String mobileNo;
  final String email;
  final File idImage;

  final _fireStore = FirebaseFirestore.instance;
  final String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  //User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.all(20),
                  //shadowColor: Colors.yellow,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide.
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          // padding: EdgeInsets.all(20),
                          /*height: 100,
                            width: 300,*/
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.file(idImage),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$name', style: KPreviewText),
                                KSizedBoxPreview,
                                Text('$organisationName', style: KPreviewText),
                                KSizedBoxPreview,
                                Text('$empId', style: KPreviewText),
                                KSizedBoxPreview,
                                Text('$mobileNo', style: KPreviewText),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton.extended(
                        label: Text('Submit'),
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        splashColor: Colors.black,
                        onPressed: () {
                          _fireStore.collection('user').add({
                            'date': date,
                            'empIdNo': empId,
                            'mobileNo': mobileNo,
                            'name': name,
                            'organisationName': organisationName,
                          });

                          String imageId =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          Reference ref =
                              FirebaseStorage.instance.ref().child(imageId);

                          ref.putFile(idImage);

                          Navigator.pushNamed(context, '/fooditems');

                          //print(user.uid);
                          // String uid1 = user.uid;

                          //dialogBox(context, 'Registration successful');

                          //TaskSnapshot taskSnapshot = await uploadTask.o
                        },
                        icon: Icon(
                          Icons.subdirectory_arrow_right,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
