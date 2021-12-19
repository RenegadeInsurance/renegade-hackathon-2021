import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Services/RiskAssessmentService.dart';
import 'package:hackathonfrontend/Services/UserAssessmentService.dart';
import 'package:hackathonfrontend/Services/UserService.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/WeatherForecast/Dashboard.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';

import 'Entity/User.dart';
import 'LogIn/LogInScreen.dart';
import 'Services/InitiateThreshold.dart';
import 'Services/LocationService.dart';
import 'Weather/WeatherData.dart';

Future<void> main() async {
  runApp(Hackathon());

}

class Hackathon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot snapshot1) {
            if (snapshot1.hasData) {
              SharedPreferences prefs = snapshot1.data;
              if ((prefs.getInt("userID") ?? 0) <= 0) {
                return const SignUpScreen();
              } else {
                return FutureBuilder(
                  future: UserService().fetchUsers(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<User> users = snapshot.data;
                      int id = prefs.getInt("userID") ?? 1;
                      meUser =
                          users.firstWhere((element) => element.userID == id);
                      return WeatherForecast();
                    }
                    return const SignUpScreen();
                  },
                );
              }
            }

            return const SignUpScreen();
          }),
    );
  }
}
