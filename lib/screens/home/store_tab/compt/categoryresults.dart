import 'package:flutter/material.dart';
import 'package:vinsartisanmarket/screens/home/store_tab/compt/itemgrid.dart';

// ignore: must_be_immutable
class CategoryResult extends StatelessWidget {
  final String categoryName;
  final String categoryimg;
  CategoryResult(
      {Key? key, required this.categoryName, required this.categoryimg})
      : super(key: key);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.indigo),
        title: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.04, bottom: size.height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.005),
                child: Image.asset(categoryimg, width: size.width * 0.1),
              ),
              Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: size.width * 0.07),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
                child: ListView(
                    children: [Itemgrid(scrollController: _scrollController)]))
          ],
        ),
      ),
    );
  }
}
