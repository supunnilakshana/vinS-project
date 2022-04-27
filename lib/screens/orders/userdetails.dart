import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vinsartisanmarket/components/internet_not_connect.dart';
import 'package:vinsartisanmarket/components/textfileds.dart';
import 'package:vinsartisanmarket/components/tots.dart';
import 'package:vinsartisanmarket/constansts/ui_constansts.dart';
import 'package:vinsartisanmarket/screens/home/home_screen.dart';
import 'package:vinsartisanmarket/service/network/networkhandeler.dart';
import 'package:vinsartisanmarket/service/validaters/validate_handeler.dart';

class Userdetailscreen extends StatefulWidget {
  final bool islog;
  final String text;
  final List<dynamic> colist;

  const Userdetailscreen({
    Key? key,
    this.text = "",
    required this.colist,
    this.islog = false,
  }) : super(key: key);
  @override
  _UserdetailscreenState createState() => _UserdetailscreenState();
}

class _UserdetailscreenState extends State<Userdetailscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController namecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController mobilecon = TextEditingController();
  TextEditingController addresscon = TextEditingController();
  TextEditingController notecon = TextEditingController();
  TextEditingController postalcon = TextEditingController();

  String name = "";
  String email = "";
  String mobileno = "";
  String address = "";
  String postalcode = "";
  String note = "";

  var base;
  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0XFFffffff),
        key: _scaffoldKey,
        appBar: AppBar(
            title: Center(
              child: Text(
                "Customer Details",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            print("---------------");

            // base = Base64Decoder().convert(addressimg);
            // setState(() {
            //   isimgload = true;
            // });
            if (_formKey.currentState!.validate()) {
              bool isconnect = await NetworkHandeler.hasNetwork();
              // ignore: deprecated_member_use
              _scaffoldKey.currentState!.showSnackBar(SnackBar(
                duration: const Duration(seconds: 2),
                backgroundColor: kprimaryColor,
                content: Row(
                  children: const [
                    CircularProgressIndicator(),
                    Text("  Order Processing...")
                  ],
                ),
              ));

              if (isconnect == true) {
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NointernetScreen(
                            pushscreen:
                                Userdetailscreen(colist: widget.colist))));
              }
            } else {
              print("Not Complete");
            }
          },
          label: Text(
            "Place order",
            style: TextStyle(fontSize: size.width * 0.04),
          ),
          icon: const Icon(Icons.shopping_bag_sharp),
          backgroundColor: Colors.indigo,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Color(0XFFffffff)),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.056,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        child: Gnoiconformfiled(
                          onchange: (text) {
                            name = text;
                            print(text);
                          },
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                          save: (save) {},
                          controller: namecon,
                          hintText: " Name",
                          label: " Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        // width: size.width * 0.96,
                        child: Gnoiconformfiled(
                          onchange: (text) {
                            email = text;
                          },
                          valid: (text) {
                            print(text);
                            return Validater.vaildemail(email);
                          },
                          save: (save) {},
                          controller: emailcon,
                          hintText: "Email",
                          label: "Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        // width: size.width * 0.96,
                        child: Gnoiconformfiled(
                          hintText: "Mobile No",
                          label: "Mobile No",
                          onchange: (text) {
                            mobileno = text;
                          },
                          save: (text) {},
                          controller: mobilecon,
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        // width: size.width * 0.96,
                        child: Gnoiconformfiled(
                          hintText: "Address",
                          label: "Address",
                          maxlines: 3,
                          onchange: (text) {
                            address = text;
                          },
                          save: (text) {},
                          controller: addresscon,
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        // width: size.width * 0.96,
                        child: Gnoiconformfiled(
                          hintText: "Postal Code",
                          label: "Postal Code",
                          maxlines: 1,
                          onchange: (text) {
                            postalcode = text;
                          },
                          save: (text) {},
                          controller: postalcon,
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.02,
                          left: size.width * 0.02),
                      child: Container(
                        // width: size.width * 0.96,
                        child: Gnoiconformfiled(
                          hintText: "Note",
                          label: "Note(Optional)",
                          maxlines: 2,
                          onchange: (text) {
                            note = text;
                          },
                          save: (text) {},
                          controller: notecon,
                          valid: (text) {
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
