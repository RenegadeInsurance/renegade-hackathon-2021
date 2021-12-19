import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'package:we_alert/modules/home/bloc/geoLocationBloc/geolocationbloc_bloc.dart';
import 'package:we_alert/modules/home/bloc/homepagecubit/home_page_cubit.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';
import 'package:we_alert/modules/home/widgets/app_bar_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HomePage extends StatelessWidget {
  final HomePageCubit homePageCubit;
  HomePage({Key? key, required this.homePageCubit}) : super(key: key);
  final double _pointerValue = 0;
  final List<String> weekdays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  final List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homePageCubit,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.scaffoldBgColour,
            automaticallyImplyLeading: false,
            elevation: 1,
            centerTitle: true,
            title: const HomePageAppBar(),
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              height: 570,
              child: Stack(
                children: [
                  Container(
                    height: 450,
                    decoration: BoxDecoration(color: Colors.purple.shade50),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        BlocConsumer<GeolocationblocBloc, GeolocationblocState>(
                          listener: (context, state) {
                            if (state.geoLocationStatus ==
                                GeoLocationStatus.loaded) {
                              context.read<HomePageCubit>().fetchTemperature(
                                  latitude: "${state.position.latitude}",
                                  longitude: "${state.position.longitude}",
                                  incMessage: '');
                            }
                          },
                          builder: (context, state) {
                            return CarouselSlider(
                                options: CarouselOptions(
                                    height: 300.0,
                                    onPageChanged: (val, x) async {
                                      var lat;
                                      var lon;
                                      if (val == 0) {
                                        await context
                                            .read<HomePageCubit>()
                                            .fetchTemperature(
                                                latitude: state
                                                    .position.latitude
                                                    .toString(),
                                                longitude: state
                                                    .position.longitude
                                                    .toString(),
                                                incMessage: "");
                                      } else if (val == 1) {
                                        lat = state.position.latitude +
                                            (180 / pi) * (50000 / 6378137);
                                        lon = state.position.longitude +
                                            (180 / pi) *
                                                (0 / 6378137) /
                                                cos(state.position.latitude);

                                        await context
                                            .read<HomePageCubit>()
                                            .fetchTemperature(
                                                latitude: lat.toString(),
                                                longitude: lon.toString(),
                                                incMessage: "+ 50 Km East");
                                      } else if (val == 2) {
                                        lat = state.position.latitude +
                                            (180 / pi) * (-50000 / 6378137);
                                        lon = state.position.longitude +
                                            (180 / pi) *
                                                (0 / 6378137) /
                                                cos(state.position.latitude);

                                        await context
                                            .read<HomePageCubit>()
                                            .fetchTemperature(
                                                latitude: lat.toString(),
                                                longitude: lon.toString(),
                                                incMessage: "+ 50 Km West");
                                      } else if (val == 3) {
                                        lat = state.position.latitude +
                                            (180 / pi) * (0 / 6378137);
                                        lon = state.position.longitude +
                                            (180 / pi) *
                                                (50000 / 6378137) /
                                                cos(state.position.latitude);

                                        await context
                                            .read<HomePageCubit>()
                                            .fetchTemperature(
                                                latitude: lat.toString(),
                                                longitude: lon.toString(),
                                                incMessage: "+ 50 Km North");
                                      } else {
                                        lat = state.position.latitude +
                                            (180 / pi) * (0 / 6378137);
                                        lon = state.position.longitude +
                                            (180 / pi) *
                                                (-50000 / 6378137) /
                                                cos(state.position.latitude);

                                        await context
                                            .read<HomePageCubit>()
                                            .fetchTemperature(
                                                latitude: lat.toString(),
                                                longitude: lon.toString(),
                                                incMessage: "+ 50 Km South");
                                      }
                                    }),
                                items: List.generate(
                                    5,
                                    (index) => Builder(
                                          builder: (BuildContext context) {
                                            return Stack(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.4,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 20),
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 15.0,
                                                            vertical: 15),
                                                    decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                        gradient: const LinearGradient(
                                                            colors: [
                                                              Colors.blueAccent,
                                                              Colors.purple
                                                            ],
                                                            begin:
                                                                FractionalOffset(
                                                                    0, 0),
                                                            end:
                                                                FractionalOffset(
                                                                    0.9, 0),
                                                            stops: [0.0, 1.0],
                                                            tileMode:
                                                                TileMode.clamp),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(85)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              '${context.read<GeolocationblocBloc>().state.address}',
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),
                                                            BlocBuilder<
                                                                HomePageCubit,
                                                                HomePageState>(
                                                              builder: (context,
                                                                  homestate) {
                                                                return Text(
                                                                  homestate
                                                                      .incrementMessage,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            BlocBuilder<
                                                                HomePageCubit,
                                                                HomePageState>(
                                                              builder: (context,
                                                                  homestate) {
                                                                return Text(
                                                                  homestate.temperatureStatus ==
                                                                          TemperatureStatus
                                                                              .fetched
                                                                      ? homestate.weatherResponse ==
                                                                              null
                                                                          ? "XX"
                                                                          : (homestate.weatherResponse!.main!.temp! - 273.15)
                                                                              .toStringAsFixed(1)
                                                                      : 'XX',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          100,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                );
                                                              },
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Text(
                                                                'o',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Text(
                                                          'Rainy-Cloudy',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    )),
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          "${weekdays[DateTime.now().weekday - 1]}, ${DateTime.now().day} ${month[DateTime.now().month - 1]}",
                                                          style: const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      height: 40,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.9))),
                                                ),
                                              ],
                                            );
                                          },
                                        )));
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 375,
                    child: Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width / 1.13,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/wind.png',
                                    width: 35,
                                  ),
                                  const SizedBox(height: 10),
                                  BlocBuilder<HomePageCubit, HomePageState>(
                                    builder: (context, homestate) {
                                      return Text(
                                        homestate.temperatureStatus ==
                                                TemperatureStatus.fetched
                                            ? homestate.weatherResponse == null
                                                ? "XX"
                                                : homestate.weatherResponse!
                                                            .wind ==
                                                        null
                                                    ? "XX"
                                                    : "${(homestate.weatherResponse!.wind!.speed)!.toStringAsFixed(1)} km/h"
                                            : "XX",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    'Wind',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: ColorConstants.lightishText),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/humidity.png',
                                    width: 35,
                                  ),
                                  const SizedBox(height: 10),
                                  BlocBuilder<HomePageCubit, HomePageState>(
                                    builder: (context, homestate) {
                                      return Text(
                                        homestate.temperatureStatus ==
                                                TemperatureStatus.fetched
                                            ? homestate.weatherResponse == null
                                                ? "XX"
                                                : homestate.weatherResponse!
                                                            .main ==
                                                        null
                                                    ? "XX"
                                                    : '${homestate.weatherResponse!.main!.humidity} %'
                                            : "XX",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: ColorConstants.lightishText),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/visible.png',
                                    width: 35,
                                  ),
                                  const SizedBox(height: 10),
                                  BlocBuilder<HomePageCubit, HomePageState>(
                                    builder: (context, homestate) {
                                      return Text(
                                        homestate.temperatureStatus ==
                                                TemperatureStatus.fetched
                                            ? homestate.weatherResponse == null
                                                ? "XX"
                                                : homestate.weatherResponse!
                                                            .visibility ==
                                                        null
                                                    ? "XX"
                                                    : '${(homestate.weatherResponse!.visibility! / 1000).toStringAsFixed(1)} Km'
                                            : "XX",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    'Visibility',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: ColorConstants.lightishText),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Water Level Alert',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.03,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: LiquidCircularProgressIndicator(
                          value: 0.6,
                          backgroundColor: Colors.grey.shade100,
                          valueColor: const AlwaysStoppedAnimation(Colors.blue),
                          center: const Text(
                            "25 mm",
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Water Level',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('23', style: TextStyle(fontSize: 35)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Critical',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.red)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Survey Analysis Report',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.03,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Location',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<GeolocationblocBloc, GeolocationblocState>(
                          builder: (context, state) {
                            return Text('${state.address}');
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Analysis Report',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Currently you location traces as higher risk area as per the general survey report',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 15.2),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RadialGauge(
                        axes: [
                          RadialGaugeAxis(
                            minValue: 0,
                            maxValue: 100,
                            minAngle: -150,
                            maxAngle: 150,
                            radius: 0.6,
                            width: 0.2,
                            segments: const [
                              RadialGaugeSegment(
                                  minValue: 0,
                                  maxValue: 20,
                                  minAngle: -150,
                                  maxAngle: -150 + 60.0 - 1,
                                  color: Colors.green),
                              RadialGaugeSegment(
                                minValue: 20,
                                maxValue: 40,
                                minAngle: -150.0 + 60,
                                maxAngle: -150.0 + 120 - 1,
                                color: Colors.lightGreen,
                              ),
                              RadialGaugeSegment(
                                minValue: 40,
                                maxValue: 60,
                                minAngle: -150.0 + 120,
                                maxAngle: -150.0 + 180 - 1,
                                color: Colors.yellow,
                              ),
                              RadialGaugeSegment(
                                minValue: 60,
                                maxValue: 80,
                                minAngle: -150.0 + 180,
                                maxAngle: -150.0 + 240 - 1,
                                color: Colors.orange,
                              ),
                              RadialGaugeSegment(
                                minValue: 80,
                                maxValue: 100,
                                minAngle: -150.0 + 240,
                                maxAngle: -150.0 + 300,
                                color: Colors.red,
                              ),
                            ],
                            pointers: [
                              RadialNeedlePointer(
                                value: _pointerValue,
                                thicknessStart: 20,
                                thicknessEnd: 0,
                                length: 0.6,
                                knobRadiusAbsolute: 10,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(Colors.grey[400]!.value),
                                    Color(Colors.grey[400]!.value),
                                    Color(Colors.grey[600]!.value),
                                    Color(Colors.grey[600]!.value)
                                  ],
                                  stops: const [0, 0.5, 0.5, 1],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
          ]))),
    );
  }
}
