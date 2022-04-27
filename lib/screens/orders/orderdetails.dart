import 'package:flutter/material.dart';

import 'package:vinsartisanmarket/components/internet_not_connect.dart';
import 'package:vinsartisanmarket/constansts/ui_constansts.dart';
import 'package:vinsartisanmarket/screens/orders/userdetails.dart';
import 'package:vinsartisanmarket/service/network/networkhandeler.dart';

class Orderdetails extends StatefulWidget {
  final double total;

  const Orderdetails({Key? key, this.total = 500.0}) : super(key: key);
  @override
  _OrderdetailsState createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  List<DataRow> datarow = [];

  @override
  void initState() {
    loaddata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Order Details",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            print("pressed");
            bool isconnect = await NetworkHandeler.hasNetwork();
            if (isconnect == true) {
              print("connect");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Userdetailscreen(
                            colist: [],
                          )));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NointernetScreen(
                          pushscreen: Orderdetails(total: widget.total))));
            }

            //  await DataHandeler.createOrder(order);
          },
          label: Text("Continue"),
          icon: Icon(Icons.arrow_forward_ios_sharp),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(color: Color(0XFFffffff)),
            height: size.height * 0.82,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width,
                      child: DataTable(columns: [
                        DataColumn(
                            label: Text('',
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.8),
                                ))),
                        DataColumn(
                            label: Text('',
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.8),
                                ))),
                      ], rows: datarow),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: klightbackgoundcolor),
            height: size.height * 0.08,
            width: size.width,
            //  height: size.height * 0.06,
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, top: size.height * 0.02),
              child: Text(
                "Total " + widget.total.toStringAsFixed(0) + "\$",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: size.width * 0.043,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ]));
  }

  loaddata() async {
    List<int> sampledata = [10, 30, 40, 50, 70];

    sampledata.forEach((element) {
      DataRow d = DataRow(cells: [
        DataCell(Text(
          "i phone 6s",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.8),
          ),
        )),
        DataCell(
          Text(
            " 10" + "\$" + " X " + element.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
      ]);
      setState(() {
        datarow.add(d);
      });
    });
  }
}
