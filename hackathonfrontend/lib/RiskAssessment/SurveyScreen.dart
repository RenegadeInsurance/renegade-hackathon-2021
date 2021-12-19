import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathonfrontend/Entity/FAQ.dart';
import 'package:hackathonfrontend/Entity/RiskAssessment.dart';
import 'package:hackathonfrontend/Entity/UserAssessment.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/RiskAssessment/RiskAssessment.dart';
import 'package:hackathonfrontend/RiskAssessment/SurveyQuestion.dart';
import 'package:hackathonfrontend/RiskAssessment/SurveyReport.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';

class SurveyScreen extends StatefulWidget {
  final MapEntry<int, RiskAssessmentEntity> riskAssessment;
  final List<FAQ> faqs;
  final Function refresh;

  SurveyScreen(this.riskAssessment, this.faqs, this.refresh);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int currentNode = 0;
  bool isDismissed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0B122F),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Header(2, false),
              if (currentNode != 0)
                Builder(builder: (context) {
                  FAQ personalFAQ = widget.faqs
                      .firstWhere((element) => element.FAQID == currentNode);
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          personalFAQ.question,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button("YES", () {
                          if (personalFAQ.yesNode == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return SurveyReport(
                                      widget.riskAssessment.value
                                          .riskAssessmentID,
                                      personalFAQ.yesRiskFactor,
                                      widget.refresh);
                                },
                              ),
                            );
                          } else {
                            setState(() {
                              currentNode = personalFAQ.yesNode;
                            });
                          }
                        }, Color(0xff6DA7FE), Icons.add, false),
                        SizedBox(
                          height: 10,
                        ),
                        Button("NO", () {
                          if (personalFAQ.noNode == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return SurveyReport(
                                      widget.riskAssessment.value
                                          .riskAssessmentID,
                                      personalFAQ.noRiskFactor,
                                      widget.refresh);
                                },
                              ),
                            );
                          } else {
                            setState(() {
                              currentNode = personalFAQ.noNode;
                            });
                          }
                        }, Color(0xff6DA7FE), Icons.add, false),
                        Expanded(child: Container()),
                        isDismissed
                            ? Container()
                            : Container(
                                padding: EdgeInsets.all(12),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius12(),
                                  boxShadow: customBoxShadow(),
                                  color: Color(0xff182040),
                                ),
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
                                            personalFAQ.riskAssessmentID - 1],
                                        height: 20,
                                        width: 20,
                                      )),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Please select the best response feasible in order to obtain accurate information.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isDismissed = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  );
                })
              else
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff6DA7FE)),
                        child: Center(
                          child: SvgPicture.asset(
                            svgImages[
                                widget.riskAssessment.value.riskAssessmentID -
                                    1],
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Heading16Bold(
                          widget.riskAssessment.value.title, Colors.white),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff6DA7FE),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              try {
                                FAQ faq = widget.faqs
                                    .firstWhere((element) => element.isStart);
                                setState(() {
                                  currentNode = faq.FAQID;
                                });
                              } catch (e) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) {
                                    return SurveyReport(
                                        widget.riskAssessment.value
                                            .riskAssessmentID,
                                        0,
                                        widget.refresh);
                                  }),
                                );
                              }
                            },
                            child: Center(
                              child: Heading16("START SURVEY", Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
