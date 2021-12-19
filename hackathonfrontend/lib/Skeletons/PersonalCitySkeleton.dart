import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shimmer/shimmer.dart';

class PersonalCitySkeleton extends StatelessWidget {
  PersonalCitySkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
          colors: [Colors.grey.withOpacity(0.2), Color(0xff9AA0BDFF).withOpacity(0.2)]),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 12.0, top: 12.0),
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          width: 100,
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
                height: 60,
                width: 60,
                color: Colors.yellow,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  width: 111,
                  height: 0.7,
                  color: Colors.black,
                ),
              ),
              Heading12("", Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
