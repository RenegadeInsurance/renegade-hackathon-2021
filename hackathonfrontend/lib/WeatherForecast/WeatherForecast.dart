import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/DIalogBox/AddPersonalContact.dart';
import 'package:hackathonfrontend/RiskAssessment/RiskAssessment.dart';
import 'package:hackathonfrontend/WeatherForecast/Dashboard.dart';
import 'package:hackathonfrontend/components/AlertGroup/AlertGroup.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';

class WeatherForecast extends StatefulWidget {
  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  int index = 1;
  bool isModal = false;

  Widget changeActivity(int index) {
    if (index == 0) {
      return RiskAssessment(setBottomBarIndex);
    } else if (index == 1) {
      return Dashboard(setBottomBarIndex);
    } else if (index == 3) {
      return AlertGroup(setBottomBarIndex, _bringModal);
    } else {
      return Container();
    }
  }

  setBottomBarIndex(index) {
    setState(() {
      this.index = index;
    });
  }

  _bringModal() {
    setState(() {
      isModal = !isModal;
    });
  }

  Future<bool> _onBackPressed() async {
    setState(() {
      index = 1;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff0B122F),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(child: changeActivity(index)),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: 80,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      CustomPaint(
                        size: Size(size.width, 80),
                        painter: BNBCustomPainter(),
                      ),
                      Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton(
                            backgroundColor:
                                index == 0 ? Color(0xff6DA7FE) : Colors.white,
                            child: Icon(
                              Icons.add,
                              color:
                                  index == 0 ? Colors.white : Color(0xff6DA7FE),
                              size: 30,
                            ),
                            elevation: 0.1,
                            onPressed: () {
                              setBottomBarIndex(0);
                            }),
                      ),
                      Container(
                        width: size.width,
                        height: 80,
                        // color: Color(0xff182040),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.dashboard,
                                color: index == 1
                                    ? Color(0xff6DA7FE)
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              },
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     setBottomBarIndex(2);
                            //   },
                            //   child: SvgPicture.asset(
                            //     "assets/fluent_weather-hail-day-20-filled.svg",
                            //     color: index == 2
                            //         ? Color(0xff6DA7FE)
                            //         : Colors.grey.shade400,
                            //   ),
                            // ),
                            Container(
                              width: size.width * 0.20,
                            ),
                            IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(
                                  Icons.people_alt_sharp,
                                  color: index == 3
                                      ? Color(0xff6DA7FE)
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            // IconButton(
                            //     splashColor: Colors.transparent,
                            //     highlightColor: Colors.transparent,
                            //     icon: Icon(
                            //       Icons.person,
                            //       color: index == 4
                            //           ? Color(0xff6DA7FE)
                            //           : Colors.grey.shade400,
                            //     ),
                            //     onPressed: () {
                            //       setBottomBarIndex(4);
                            //     }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isModal
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(0.1),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 2 / 3.35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                              ),
                              child: AddPersonalContact(_bringModal,setBottomBarIndex),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff182040)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
