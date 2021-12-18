import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathonfrontend/Entity/FAQ.dart';
import 'package:hackathonfrontend/Entity/RiskAssessment.dart';
import 'package:hackathonfrontend/Entity/UserAssessment.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/RiskAssessment/RiskAssessment.dart';
import 'package:hackathonfrontend/RiskAssessment/SurveyQuestion.dart';
import 'package:hackathonfrontend/RiskAssessment/SurveyReport.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';

class SurveyScreen extends StatelessWidget {
  final MapEntry<int, RiskAssessmentEntity> riskAssessment;
  final List<FAQ> faqs;

  SurveyScreen(this.riskAssessment, this.faqs);

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
                          svgImages[riskAssessment.key],
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Heading16Bold(riskAssessment.value.title, Colors.white),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  try{
                                    FAQ faq = faqs.firstWhere(
                                        (element) => element.isStart);
                                    return SurveyQuestion(faqs, faq.FAQID);
                                  }catch(e){
                                    return SurveyReport(0);
                                  }
                                },
                              ),
                            );
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
