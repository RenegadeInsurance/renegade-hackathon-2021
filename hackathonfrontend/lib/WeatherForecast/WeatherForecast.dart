import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  List<Widget> screens = [Container(),Dashboard(),Container(),AlertGroup(),Container(),];

  Widget changeActivity(int index) {
    return screens[index];
  }

  setBottomBarIndex(index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
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
                          backgroundColor: Color(0xff6DA7FE),
                          child: Icon(Icons.add,size: 30,),
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
                          InkWell(
                            onTap: (){
                              setBottomBarIndex(2);
                            },
                            child: SvgPicture.asset(
                              "assets/fluent_weather-hail-day-20-filled.svg",
                              color: index == 2
                                  ? Color(0xff6DA7FE)
                                  : Colors.grey.shade400,
                            ),
                          ),
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
                          IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.person,
                                color: index == 4
                                    ? Color(0xff6DA7FE)
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(4);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
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
