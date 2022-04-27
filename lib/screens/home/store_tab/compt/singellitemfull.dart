import 'package:flutter/material.dart';
import 'package:vinsartisanmarket/components/p_v_slider.dart';
import 'package:vinsartisanmarket/components/tots.dart';
import 'package:vinsartisanmarket/constansts/ui_constansts.dart';
import 'package:vinsartisanmarket/screens/home/store_tab/compt/suggestsItems.dart';
import 'package:vinsartisanmarket/screens/orders/orderdetails.dart';
import 'package:vinsartisanmarket/test/testdata_handeler.dart';

class Singelitemfull extends StatefulWidget {
  const Singelitemfull({
    Key? key,
    required this.imglist,
    required this.pid,
    required this.productname,
    required this.price,
    required this.preprice,
    required this.discount,
    required this.status,
    required this.description,
  }) : super(key: key);

  final List<Widget> imglist;
  final String pid;
  final String productname;
  final String description;
  final double price;
  final double preprice;
  final double discount;
  final bool status;

  @override
  _SingelitemfullState createState() => _SingelitemfullState();
}

class _SingelitemfullState extends State<Singelitemfull> {
  double total = 0.0;
  int itemquantity = 1;
  late bool isdiscount;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.discount > 0) {
      isdiscount = true;
    } else {
      isdiscount = false;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.productname,
            style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.06),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Wrap(
          //will break to another line on overflow
          direction: Axis.horizontal, //use vertical to show  on vertical axis
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                    heroTag: "btn1",
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () async {
                      print("pressed");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Orderdetails(
                                    total: total,
                                  )));
                    },
                    label: const Text("Buy It Now"))),
            // button third//button first

            // button second

            Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    backgroundColor: Colors.indigo,
                    onPressed: () async {
                      Customtost.cartadd();
                    },
                    label: const Text("Add to cart"))),
            // button third

            // Add more buttons here
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
                width: size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PVslider(list: widget.imglist),
              ),
              SizedBox(
                height: size.height * 0.01,
                width: size.width,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(children: [
                    Text(
                      widget.price.toStringAsFixed(0) + "\$",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    isdiscount
                        ? Text(widget.preprice.toStringAsFixed(0) + "\$",
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough))
                        : SizedBox(
                            width: size.width * 0.0,
                          ),
                  ]),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(widget.description,
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                  ),
                  Text("Quantity  ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    width: size.width * 0.19,
                    padding: EdgeInsets.all(size.width * 0.007),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                        color: Colors.indigoAccent),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if (itemquantity > 0) {
                                setState(() {
                                  itemquantity--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: size.width * 0.04,
                            )),
                        Container(
                          width: size.width * 0.075,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.007),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.007,
                              vertical: size.width * 0.005),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.007),
                              color: Colors.white),
                          child: Text(
                            itemquantity.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.04),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              if (itemquantity < 100) {
                                setState(() {
                                  itemquantity++;
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: size.width * 0.04,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: size.height * 0.01, left: size.width * 0.02),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Suggested Products ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.7),
                        fontSize: size.width * 0.05),
                  ),
                ),
              ),
              const SuggestItemView()
            ],
          ),
        ));
  }
}
