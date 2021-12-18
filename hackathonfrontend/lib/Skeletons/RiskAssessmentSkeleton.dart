import 'package:flutter/material.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:shimmer/shimmer.dart';

class RiskAssessmentSkeleton extends StatelessWidget {
  const RiskAssessmentSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ["", "", "", ""]
          .map(
            (e) => Column(
          children: [
            Shimmer(

              gradient: LinearGradient(
                  colors: [Colors.grey, Color(0xff9AA0BDFF)]),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: borderRadius12(),
                    color: Colors.white.withOpacity(0.5)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12,
                          left: 12,
                          right: 12,
                          bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff6DA7FE).withOpacity(0.1),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      )
          .toList(),
    );
  }
}
