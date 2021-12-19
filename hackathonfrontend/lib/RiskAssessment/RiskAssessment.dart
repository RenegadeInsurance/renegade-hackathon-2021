import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Entity/FAQ.dart';
import 'package:hackathonfrontend/Entity/RiskAssessment.dart';
import 'package:hackathonfrontend/Entity/UserAssessment.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/RiskAssessment/SurveyScreen.dart';
import 'package:hackathonfrontend/Services/FAQService.dart';
import 'package:hackathonfrontend/Services/RiskAssessmentService.dart';
import 'package:hackathonfrontend/Services/UserAssessmentService.dart';
import 'package:hackathonfrontend/Skeletons/RiskAssessmentSkeleton.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shimmer/shimmer.dart';

import '../data.dart';

class RiskAssessment extends StatefulWidget {
  final Function setBottomBarIndex;

  RiskAssessment(this.setBottomBarIndex);

  @override
  State<RiskAssessment> createState() => _RiskAssessmentState();
}

class _RiskAssessmentState extends State<RiskAssessment> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          widget.setBottomBarIndex(1);
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Color(0xff0B122F),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Header(2, false),
                SizedBox(
                  height: 20,
                ),
                Heading14(
                    "Please choose the risk assessment test", Colors.white),
                SizedBox(
                  height: 12,
                ),
                // height: 174,
                FutureBuilder(
                  future: RiskAssessmentService()
                      .fetchRiskAssessments()
                      .then((value) async {
                    List aList = await UserAssessmentService()
                        .fetchUserAssessments()
                        .then((value1) async {
                      List bList = await FAQService()
                          .fetchFAQs()
                          .then((value2) => [value, value1, value2]);
                      return bList;
                    });
                    return aList;
                  }),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<RiskAssessmentEntity> riskAssessments =
                          snapshot.data[0];
                      List<UserAssessment> userAssessments = snapshot.data[1];
                      List<FAQ> faqs = snapshot.data[2];
                      return Column(
                        children: riskAssessments.asMap().entries.map((e) {
                          bool isTaken = false;
                          double score = 0;
                          for (var element in userAssessments) {
                            if (element.riskAssessmentID ==
                                    e.value.riskAssessmentID &&
                                element.userID == meUser!.userID) {
                              isTaken = element.isTaken;
                              score = element.riskFactor;
                            }
                          }
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius12(),
                                  boxShadow: customBoxShadow(),
                                  color: Color(0xff182040),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff6DA7FE),
                                            ),
                                            child: Center(
                                                child: SvgPicture.asset(
                                              svgImages[
                                                  e.value.riskAssessmentID - 1],
                                              height: 20,
                                              width: 20,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Heading14(
                                                e.value.title,
                                                Colors.white,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              isTaken
                                                  ? Text(
                                                      "Last score: $score",
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          fontSize: 12),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius12(),
                                              border: Border.all(
                                                color: Color(0xff6DA7FE),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (_) {
                                                  return SurveyScreen(
                                                    e,
                                                    faqs
                                                        .where((element) =>
                                                            e.value
                                                                .riskAssessmentID ==
                                                            element
                                                                .riskAssessmentID)
                                                        .toList(),
                                                    refresh,
                                                  );
                                                }));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Heading14(
                                                    isTaken
                                                        ? "Retake Test"
                                                        : "Take Test",
                                                    Color(0xff6DA7FE)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        e.value.remarks,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return RiskAssessmentSkeleton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
