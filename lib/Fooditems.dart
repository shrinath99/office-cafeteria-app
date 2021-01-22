import 'package:apnatiffin/OrderPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'FoodListInfo.dart';
import 'FoodInfo.dart';
//import 'OrderPage.dart';

class FoodList extends StatelessWidget {
  String title;
  String price;
  Image image;
  int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Food Items',
          style: TextStyle(
            color: Colors.black,
            //fontFamily: 'RobotoMono',
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              //physics: ScrollPhysics(),
              shrinkWrap: true,
              children: foodItems.map((items) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return OrderPage(
                          title: items.title,
                          price: items.price,
                          image: items.image,
                          id: items.id,
                        );
                      }),
                    );
                  },
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 8,
                    borderOnForeground: true,

                    //ColoredBox(color: Colors.yellow),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),

                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),

                    child: Container(
                      // margin: EdgeInsets.all(20),
                      //color: Colors.red,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),*/
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Hero(
                            //tag: 'menuphoto',
                            tag: "avatar_" + items.id.toString(),
                            child: Container(
                              child: items.image,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60),
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  items.title,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  items.price,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
