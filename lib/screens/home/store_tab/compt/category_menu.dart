import 'package:flutter/material.dart';
import 'package:vinsartisanmarket/components/categoryitem.dart';

class Categorymenu extends StatelessWidget {
  final Function arts;
  final Function craft;
  final Function sketch;
  final Function paint;
  final Function brush;
  final Function fabric;
  final Function crafttool;
  final Function arttool;

  const Categorymenu({
    Key? key,
    required this.arts,
    required this.craft,
    required this.sketch,
    required this.paint,
    required this.brush,
    required this.fabric,
    required this.crafttool,
    required this.arttool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigoAccent.withOpacity(0.18),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.01, right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      arts();
                    },
                    child: const CategoryItem(
                      imgsrc: 'assets/icons/arts.png',
                      label: 'Art Items',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      craft();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/craft.png",
                      label: 'Craft Items',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.025,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      sketch();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/sketch.png",
                      label: 'Sketch Tools',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      paint();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/paints.png",
                      label: 'Paints',
                    ),
                  ),
                ),
              ],
            ),
            //row brake
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      brush();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/brush.png",
                      label: 'Brushes',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.01, right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      fabric();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/fabric.png",
                      label: 'Fabrics',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.025),
                  child: GestureDetector(
                    onTap: () {
                      crafttool();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/crafttool.png",
                      label: 'Craft Tool',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.025,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      arttool();
                    },
                    child: const CategoryItem(
                      imgsrc: "assets/icons/arttools.png",
                      label: 'Art Tool',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
