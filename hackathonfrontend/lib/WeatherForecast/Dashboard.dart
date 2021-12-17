import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherDetails.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B122F),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(0, false,),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Heading2(
                      "Good Afternoon!",
                      Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Heading1(
                      "Hilife Team",
                      Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(12),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: borderRadius12(),
                boxShadow: customBoxShadow(),
                color: Color(0xff182040),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/eva_alert-triangle-fill.svg",
                    color: Color(0xff6DA7FE),
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      "Water level is continuously rising but still below critical level.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                children: [
                  Heading2(
                    "Weather",
                    Colors.white,
                  ),
                  Expanded(child: Container()),
                  Heading2(
                    "Last Updated: 4.00 AM",
                    Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/Vector.svg",
                    height: 14,
                    width: 14,
                  ),
                ],
              ),
            ),
            Container(
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
                                Heading3("Kathmandu, Nepal", Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                smallText("Sunday", Colors.grey),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/fluent_weather-hail-day-20-filled.svg",
                              height: 90,
                              width: 90,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "24",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "°",
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
                            Heading3(
                                "Chances of rain is very low", Colors.grey),
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
                      Heading3("Wind: ", Colors.grey),
                      SizedBox(
                        height: 5,
                      ),
                      Heading3("1.2 km/hr", Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      Heading3("Chances of rain: ", Colors.grey),
                      SizedBox(
                        height: 5,
                      ),
                      Heading3("16%", Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      Heading3("Humidity: ", Colors.grey),
                      SizedBox(
                        height: 5,
                      ),
                      Heading3("52%", Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                "Tue: 30°",
                "Wed: 30°",
                "Thu: 30°",
                "Fri: 30°",
              ]
                  .map(
                    (e) =>
                    Row(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(right: 12, top: 12, bottom: 12),
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius12(),
                            boxShadow: customBoxShadow(),
                            color: Color(0xff182040),
                          ),
                          child: Center(child: Heading2(e, Colors.grey)),
                        ),
                      ],
                    ),
              )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Heading2("Weather details of other places", Colors.white),
            // SizedBox(height:12,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherDetails("assets/fluent_weather-hail-day-20-filled.svg","24°","Nepalgung"),
                  WeatherDetails("assets/fluent_weather-cloudy-20-filled.svg","34°","Kathmandu"),
                  WeatherDetails("assets/fluent_weather-fog-24-filled.svg","14°","Bhatgaun"),
                  WeatherDetails("assets/fluent_weather-hail-day-20-filled.svg","24°","Nepalgung"),
                  WeatherDetails("assets/fluent_weather-cloudy-20-filled.svg","34°","Kathmandu"),
                  WeatherDetails("assets/fluent_weather-fog-24-filled.svg","14°","Bhatgaun"),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, bottom: 12.0, top: 12.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      width: 111,
                      height: 175,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Color(0xff182040),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              "assets/akar-icons_plus.svg",
                              height: 60,
                              width: 60,
                              color: Color(0xff6DA7FE),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Heading3("Add New", Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
