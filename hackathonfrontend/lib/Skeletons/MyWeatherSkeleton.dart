import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shimmer/shimmer.dart';

class MyWeatherSkeleton extends StatelessWidget {
  const MyWeatherSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [Colors.grey, Color(0xff9AA0BDFF)]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius12(),
          boxShadow: customBoxShadow(),
          color: Color(0xff182040),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Group.svg",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Heading12("", Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          smallText("", Colors.grey),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/eva_alert-triangle-fill.svg",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Heading12("", Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 0.9,
              height: 190,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Heading12("", Colors.grey),
                SizedBox(
                  height: 5,
                ),
                Heading12("", Colors.white),
                SizedBox(
                  height: 20,
                ),
                Heading12("", Colors.grey),
                SizedBox(
                  height: 5,
                ),
                Heading12("", Colors.white),
                SizedBox(
                  height: 20,
                ),
                Heading12("", Colors.grey),
                SizedBox(
                  height: 5,
                ),
                Heading12("", Colors.white),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
