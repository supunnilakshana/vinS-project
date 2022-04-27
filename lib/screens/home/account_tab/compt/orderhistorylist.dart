import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vinsartisanmarket/constansts/ui_constansts.dart';
import 'package:vinsartisanmarket/test/testdata_handeler.dart';
import 'package:vinsartisanmarket/test/testmodel.dart';

import 'noodrderhostory.dart';

class Orderhistoryscreen extends StatefulWidget {
  final String uid;
  const Orderhistoryscreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  _OrderhistoryscreenState createState() => _OrderhistoryscreenState();
}

class _OrderhistoryscreenState extends State<Orderhistoryscreen> {
  late Future<List<TestModel>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = TestDataHandeler.fetchTestModel();
  }

  double total = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kprimarylightcolor,
      appBar: AppBar(
          title: Center(
            child: Text(
              "Order History",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700),
            ),
          ),
          elevation: 0,
          backgroundColor: kprimaryColor, // Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          )),
      body: Container(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TestModel> data = snapshot.data as List<TestModel>;
              print(data);
              if (data.isNotEmpty) {
                int st;
                return Container(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, indext) {
                          var rng = Random(); //for test and view
                          st = rng.nextInt(3);
                          total = 450.50;
                          return GestureDetector(
                            onTap: () {
                              _openPopuporder(context);
                            },
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                    child: Container(
                                  child: Image.asset(
                                    st == 1
                                        ? "assets/icons/proceesing.png"
                                        : st == 2
                                            ? "assets/icons/delivered.png"
                                            : "assets/icons/unknown.png",
                                    width: size.width * 0.175,
                                  ),
                                )),
                                title: Text(
                                  "od-3465",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.037),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                        "Total " +
                                            total.toStringAsFixed(0) +
                                            "\$",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))),
                                    SizedBox(
                                      width: size.width * 0.11,
                                    ),
                                    Text(
                                        st == 1
                                            ? "Status : processing"
                                            : st == 2
                                                ? "Status : Delivered "
                                                : "Status : Unkown",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7)))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
              } else {
                return Noorderhistory();
              }
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return Center(
                child: Lottie.asset("assets/animation/loadingindicator.json",
                    width: size.height * 0.12));
          },
        ),
      ),
    );
  }

  _openPopuporder(context) {
    Size size = MediaQuery.of(context).size;
    Alert(
        context: context,
        title: "Order details",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Order id : od-3465",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Customer name : Supun Nilakshana",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Total :  " + total.toStringAsFixed(0) + "\$",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Mobile : 0711234567",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Order status : Delivered",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.01, left: size.width * 0.035),
              child: Text(
                "Ordered Date :  2021-01-20",
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.green,
            child: Text(
              "OK",
              style:
                  TextStyle(color: Colors.white, fontSize: size.width * 0.05),
            ),
          )
        ]).show();
  }
}
