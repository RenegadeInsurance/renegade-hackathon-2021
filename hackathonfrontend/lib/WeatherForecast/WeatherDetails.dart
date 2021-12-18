import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hackathonfrontend/components/texts.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetails extends StatelessWidget {
  final BoxedIcon icon;
  final String temperature;
  final String Location;

  WeatherDetails(this.icon, this.temperature, this.Location);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 12.0, bottom: 12.0, top: 12.0),
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        width: 111,
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
          children: [
            Container(
              child: icon
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              temperature,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 111,
                height: 0.7,
                color: Colors.black,
              ),
            ),
            Heading12(Location, Colors.white),
          ],
        ),
      ),
    );
  }
}
