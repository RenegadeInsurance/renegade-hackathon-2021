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
