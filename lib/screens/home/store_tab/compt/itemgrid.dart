import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vinsartisanmarket/components/errorpage.dart';
import 'package:vinsartisanmarket/screens/home/store_tab/compt/singelitem.dart';
import 'package:vinsartisanmarket/screens/home/store_tab/compt/singellitemfull.dart';

import 'package:vinsartisanmarket/test/testdata_handeler.dart';
import 'package:vinsartisanmarket/test/testmodel.dart';

class Itemgrid extends StatefulWidget {
  final ScrollController scrollController;
  const Itemgrid({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ItemgridState createState() {
    return _ItemgridState();
  }
}

class _ItemgridState extends State<Itemgrid> {
  late Future<List<TestModel>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = TestDataHandeler.fetchTestModel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03),
      child: Container(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TestModel> data = snapshot.data as List<TestModel>;
              print(data);

              return Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: size.width / size.height * 1.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: size.height * 0.01,
                  crossAxisSpacing: size.width * 0.05,
                  shrinkWrap: true,
                  children: List.generate(
                    data.length,
                    (index) {
                      bool status;

                      int quantity = 10;
                      if (quantity > 0) {
                        status = true;
                      } else {
                        status = false;
                      }
                      return Container(
                          child: GestureDetector(
                              onTap: () {
                                final List<Widget> imglist = [
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://www.ubuy.com.kh/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjErNHpTWERld0wuX0FDX1VMMTAyMF8uanBn.jpg",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Container(
                                      //  height: size.height * 0.01,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.blueGrey,
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://www.casio.com/content/dam/casio/product-info/locales/intl/en/timepiece/product/watch/G/GA/GA7/GA-700-1B/assets/GA-700-1B_Seq2.jpg.transform/main-visual-sp/image.jpg",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Container(
                                      //  height: size.height * 0.01,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.blueGrey,
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                                ];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Singelitemfull(
                                              imglist: imglist,
                                              pid: 'A-456',
                                              description:
                                                  'The Casio GA110GB-1A G-Shock Gents Watch is a giant in watch proportions. Living up to the G-Shock name with the X-Large G, the black piece with a two-toned gold dial, features an analogue and digital display with shock and magnetic resistance, an auto LED light with afterglow, world time, 4 daily alarms, 1 snooze, an hourly time signal, stopwatch, countdown timer, full auto calendar and 12/24 hour formats. The watch is made for every day of the year.',
                                              discount: 50,
                                              preprice: 200,
                                              price: 150,
                                              productname: "Men's Watch",
                                              status: status,
                                            )));
                              },
                              child: SingleItem(
                                titel: "Men's Watch",
                                discount: 50,
                                price: 150,
                                pid: "A-456",
                                imgname:
                                    "https://www.ubuy.com.kh/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjErNHpTWERld0wuX0FDX1VMMTAyMF8uanBn.jpg",
                                preprice: 200,
                                status: status,
                              )));
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Errorpage(size: size.width * 0.7);
            }
            // By default show a loading spinner.
            return Center(
                child: Lottie.asset("assets/animation/loadingindicator.json",
                    width: size.height * 0.28));
          },
        ),
      ),
    );
  }
}
