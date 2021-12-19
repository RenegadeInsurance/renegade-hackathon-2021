import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathonfrontend/DIalogBox/AddNewCountry.dart';
import 'package:hackathonfrontend/Entity/PersonalCity.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/Services/PersonalCityService.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/Skeletons/ForecastSkeleton.dart';
import 'package:hackathonfrontend/Skeletons/MyWeatherSkeleton.dart';
import 'package:hackathonfrontend/Skeletons/PersonalCitySkeleton.dart';
import 'package:hackathonfrontend/Weather/WeatherCondtions.dart';
import 'package:hackathonfrontend/Weather/WeatherData.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherDetails.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import '../data.dart';
import 'MyWeather.dart';

class Dashboard extends StatefulWidget {
  final Function setBottomBarIndex;

  Dashboard(this.setBottomBarIndex);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String byHour = "Good Afternoon!";

  String currentTime = "";
  var now = DateTime.now().toString().split(" ").last;
  TimeOfDay timeOfDay = TimeOfDay(hour: 12, minute: 00);

  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    setState(() {
      if (now.hour > 12) {
        byHour = "Good Afternoon!";
      } else if (now.hour > 18) {
        byHour = "Good Evening!";
      } else {
        byHour = "Good Morning!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color(0xff0B122F),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/19.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading14(
                        byHour,
                        Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Heading20Bold(
                        meUser?.name ?? "Anonymous",
                        Colors.white,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      SharedPreferences.getInstance()
                          .then((a) => a.setInt("userID", 0));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Heading14(
                  //       "Water Level",
                  //       Colors.grey,
                  //     ),
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     Heading14(
                  //       "3cfs",
                  //       Colors.white,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   padding: EdgeInsets.all(12),
              //   height: 80,
              //   decoration: BoxDecoration(
              //     borderRadius: borderRadius12(),
              //     boxShadow: customBoxShadow(),
              //     color: Color(0xff182040),
              //   ),
              //   child: Row(
              //     children: [
              //       SvgPicture.asset(
              //         "assets/eva_alert-triangle-fill.svg",
              //         color: Color(0xff6DA7FE),
              //         height: 40,
              //         width: 40,
              //       ),
              //       SizedBox(
              //         width: 12,
              //       ),
              //       Expanded(
              //         child: Text(
              //           "Water level is continuously rising but still below critical level.",
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //             color: Colors.grey,
              //           ),
              //         ),
              //       ),
              //       Icon(
              //         Icons.clear,
              //         color: Colors.white,
              //       ),
              //     ],
              //   ),
              // ),
              FutureBuilder(
                  future: Geolocator.getCurrentPosition().then((value) {
                    DateTime now = DateTime.now();

                    currentTime =
                        "${now.hour.toString().padLeft(2, " ")}:${now.minute.toString().padLeft(2, " ")}";
                    return WeatherData()
                        .fetchWeatherOwn(value.latitude, value.longitude);
                  }),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      Weather weatherData = snapshot.data;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Row(
                              children: [
                                Heading14(
                                  "Weather",
                                  Colors.white,
                                ),
                                Expanded(child: Container()),
                                Heading14(
                                  "Last Updated: $currentTime",
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
                          MyWeather(weatherData),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Row(
                            children: [
                              Heading14(
                                "Weather",
                                Colors.white,
                              ),
                              Expanded(child: Container()),
                              Heading14(
                                "Last Updated: $currentTime",
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
                        MyWeatherSkeleton(),
                      ],
                    );
                  }),
              FutureBuilder(
                  future: Geolocator.getCurrentPosition().then((value) {
                    return WeatherData().fetchWeatherFiveDayOwn(
                        value.latitude, value.longitude);
                  }),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Weather> weathers = snapshot.data;
                      return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            ...weathers
                                .map(
                                  (e) => Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 12, top: 12, bottom: 12),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius12(),
                                          boxShadow: customBoxShadow(),
                                          color: Color(0xff182040),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Heading14Bold(
                                                    weekdays[DateTime.parse(e
                                                                    .date
                                                                    .toString())
                                                                .weekday -
                                                            1]
                                                        .substring(0, 3)
                                                        .toUpperCase(),
                                                    Colors.white),
                                                vSpace(6),
                                                Heading14(
                                                    "${DateTime.parse(e.date.toString()).hour}:${DateTime.parse(e.date.toString()).minute}",
                                                    Colors.grey),
                                                vSpace(3),
                                                Heading14(
                                                    e.temperature
                                                            .toString()
                                                            .substring(
                                                                0,
                                                                e.temperature
                                                                        .toString()
                                                                        .length -
                                                                    7) +
                                                        "℃",
                                                    Colors.grey),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ]));
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ["", "", "", "", ""]
                            .map((e) => ForecastSkeleton())
                            .toList(),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Heading14("Weather details of other places", Colors.white),
              // SizedBox(height:12,),
              FutureBuilder(
                  future:
                      PersonalCityService().fetchPersonalCitys().then((value) {
                    return value
                        .where((element) => element.userID == meUser!.userID);
                  }),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<PersonalCity> personalCitys = snapshot.data
                          .where((element) => element.userID == meUser!.userID)
                          .toList();
                      return Wrap(
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          ...personalCitys.map(
                            (e) => FutureBuilder(
                              future: WeatherData()
                                  .fetchWeatherCity(e.city)
                                  .then((value) => value),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  Weather weather = snapshot.data;
                                  return WeatherDetails(
                                      weatherCondtion(
                                          weather.weatherConditionCode!),
                                      weather.temperature.toString().substring(
                                          0,
                                          weather.temperature
                                                  .toString()
                                                  .length -
                                              7),
                                      e.city);
                                }
                                return PersonalCitySkeleton();
                              },
                            ),
                          ),
                          //     "assets/fluent_weather-cloudy-20-filled.svg",
                          //     "34°",
                          //     "Kathmandu"),
                          // WeatherDetails(
                          //     "assets/fluent_weather-fog-24-filled.svg",
                          //     "14°",
                          //     "Bhatgaun"),
                          // WeatherDetails(
                          //     "assets/fluent_weather-hail-day-20-filled.svg",
                          //     "24°",
                          //     "Nepalgung"),
                          // WeatherDetails(
                          //     "assets/fluent_weather-cloudy-20-filled.svg",
                          //     "34°",
                          //     "Kathmandu"),
                          // WeatherDetails(
                          //     "assets/fluent_weather-fog-24-filled.svg",
                          //     "14°",
                          //     "Bhatgaun"),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12.0, bottom: 12.0, top: 12.0),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AddNewCountry(refresh);
                                    });
                              },
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
                                    Heading12("Add New", Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ["", "", ""]
                            .map((e) => PersonalCitySkeleton())
                            .toList(),
                      ),
                    );
                  }),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
