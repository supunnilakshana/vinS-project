import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinsartisanmarket/service/http_handeler/httpClient.dart';

class Testscreen1 extends StatefulWidget {
  const Testscreen1({Key? key}) : super(key: key);

  @override
  State<Testscreen1> createState() => _Testscreen1State();
}

class _Testscreen1State extends State<Testscreen1> {
  HttpClient httpClient = HttpClient();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await httpClient.getAllproducts();

          print("ok...............");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
