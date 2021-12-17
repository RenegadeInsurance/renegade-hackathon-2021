import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';

import 'package:hackathonfrontend/Weather/Weather.dart';
import 'package:hackathonfrontend/components/button.dart';

import 'package:hackathonfrontend/LogIn/LogInScreen.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/components/Button.dart';

import 'package:hackathonfrontend/components/colors.dart';

import 'components/Presets.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  runApp(Hackathon());
  // CountryService().fetchCountryService();

  CountryService().fetchCityService("Bagmati");
}

class Hackathon extends StatelessWidget {
  const Hackathon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 1;

  List<Widget> screens = ["1", "2", "3", "4", "5"]
      .map(
        (e) => Container(
          child: Center(
            child: Text("Screen " + e),
          ),
        ),
      )
      .toList();

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
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.shopping_basket),
                          elevation: 0.1,
                          onPressed: () {
                            setBottomBarIndex(0);
                          }),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.home,
                              color: index == 1
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            },
                          ),
                          IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.restaurant_menu,
                                color: index == 2
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.bookmark,
                                color: index == 3
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                          IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.notifications,
                                color: index == 4
                                    ? Colors.orange
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


