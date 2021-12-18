import 'package:flutter/material.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shimmer/shimmer.dart';

class ForecastSkeleton extends StatelessWidget {
  const ForecastSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(

      gradient: LinearGradient(colors: [Colors.grey, Color(0xff9AA0BDFF)]),
      child: Container(
        margin: EdgeInsets.only(
            right: 12, top: 12, bottom: 12),
        height: 45,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: borderRadius12(),
          boxShadow: customBoxShadow(),
          color: Color(0xff182040),
        ),
        child:
        Center(child: Heading14("", Colors.grey)),
      ),
    );
  }
}
