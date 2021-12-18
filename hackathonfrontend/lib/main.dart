import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Services/RiskAssessmentService.dart';
import 'package:hackathonfrontend/Services/UserAssessmentService.dart';
import 'package:hackathonfrontend/Services/UserService.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/WeatherForecast/Dashboard.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:weather/weather.dart';

import 'LogIn/LogInScreen.dart';
import 'Services/LocationService.dart';
import 'Weather/WeatherData.dart';

Future<void> main() async {

  runApp(const Hackathon());
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
