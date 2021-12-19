import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Weather/WeatherCondtions.dart';
import 'package:hackathonfrontend/Weather/WeatherData.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';
import 'package:weather/weather.dart';

class MyWeather extends StatefulWidget {
  final Weather weatherData;

  const MyWeather(this.weatherData);

  @override
  _MyWeatherState createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Heading12(widget.weatherData.areaName.toString(),
                            Colors.white),
                        SizedBox(
                          width: 5,
                        ),
                        smallText(
                            weekdays[
                                DateTime.parse(widget.weatherData.date.toString()).weekday - 1],
                            Colors.grey),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    weatherCondtion(
                      widget.weatherData.weatherConditionCode!,
                    ),
                    Text(
                      widget.weatherData.temperature.toString().substring(0,
                          widget.weatherData.temperature.toString().length - 7),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "°C",
                      style: TextStyle(
                        fontSize: 16,
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
                    Heading12(
                        widget.weatherData.rainLast3Hours == null ||
                                widget.weatherData.rainLast3Hours! > 0.5
                            ? "Chances of rain is low"
                            : "Chances of rain is high",
                        Colors.grey),
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
              Heading12("Wind: ", Colors.grey),
              SizedBox(
                height: 5,
              ),
              Heading12("${widget.weatherData.windSpeed} km/hr", Colors.white),
              SizedBox(
                height: 20,
              ),
              Heading12("Rain last three hour: ", Colors.grey),
              SizedBox(
                height: 5,
              ),
              Heading12(
                  "${widget.weatherData.rainLast3Hours == null ? 0 : widget.weatherData.rainLast3Hours! * 100}%",
                  Colors.white),
              SizedBox(
                height: 20,
              ),
              Heading12("Humidity: ", Colors.grey),
              SizedBox(
                height: 5,
              ),
              Heading12("${widget.weatherData.humidity}%", Colors.white),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
