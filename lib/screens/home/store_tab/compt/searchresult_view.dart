import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vinsartisanmarket/components/errorpage.dart';
import 'package:vinsartisanmarket/screens/home/store_tab/compt/singelitem.dart';
import 'package:vinsartisanmarket/test/testdata_handeler.dart';
import 'package:vinsartisanmarket/test/testmodel.dart';

class Sresultview extends StatefulWidget {
  final String searchval;
  const Sresultview({
    Key? key,
    required this.searchval,
  }) : super(key: key);

  @override
  _SresultviewState createState() {
    return _SresultviewState();
  }
}

class _SresultviewState extends State<Sresultview> {
  late Future<List<TestModel>> futureData;

  @override
  void initState() {
    super.initState();
    setState(() {
      futureData = TestDataHandeler.fetchTestModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TestModel> data = snapshot.data as List<TestModel>;
              print(data.toString() + "------------------------------");
              if (data.isNotEmpty) {
                return Center(
                    child: Lottie.asset("assets/animation/noresult.json",
                        width: size.width * 0.54));
              } else {
                return Container(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: size.width / size.height,
                    crossAxisCount: 3,
                    mainAxisSpacing: size.height * 0.01,
                    crossAxisSpacing: size.width * 0.03,
                    shrinkWrap: true,
                    children: List.generate(
                      5,
                      (index) {
                        bool status;
                        int quantity = 3;
                        if (quantity > 0) {
                          status = true;
                        } else {
                          status = false;
                        }
                        return Container(
                            child: GestureDetector(
                                onTap: () {
                                  // final List<Widget> imglist = [
                                  //   YTplayer(link: data[index].vlink1),
                                  //   CachedNetworkImage(
                                  //     imageUrl: fiximagelink + data[index].image,
                                  //     progressIndicatorBuilder:
                                  //         (context, url, downloadProgress) =>
                                  //             Container(
                                  //       //  height: size.height * 0.01,
                                  //       child: Center(
                                  //         child: CircularProgressIndicator(
                                  //             color: Colors.blueGrey,
                                  //             value: downloadProgress.progress),
                                  //       ),
                                  //     ),
                                  //     errorWidget: (context, url, error) =>
                                  //         Icon(Icons.error),
                                  //   )
                                  // ];
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Singelitemfull(
                                  //               imglist: imglist,
                                  //               product: data[index],
                                  //             )));
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
              }
            } else if (snapshot.hasError) {
              return Errorpage(size: size.width * 0.7);
            }
            // By default show a loading spinner.
            return Center(
                child: Lottie.asset("assets/animation/searching.json",
                    width: size.width * 0.4));
          },
        ),
      ),
    );
  }
}
