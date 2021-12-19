import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/RiskAssessment/RiskAssessment.dart';
import 'package:hackathonfrontend/Services/UserAssessmentService.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';

class SurveyReport extends StatelessWidget {
  final int riskAssessmentID;
  final double riskFactor;
  final Function refresh;

  const SurveyReport(this.riskAssessmentID, this.riskFactor, this.refresh);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0B122F),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Header(3, false),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6DA7FE),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/trophy.svg",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Thank you for taking the time to complete the flood risk assessment survey.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "You're in the ${riskFactor > 3 ? "Low-risk" : riskFactor > 6 ? "Moderate-risk" : "High-risk"} zone based on your response with a risk factor of $riskFactor.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
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
                      UserAssessmentService()
                          .postUserAssessment(meUser!.userID, riskAssessmentID,
                              true, riskFactor)
                          .then((value) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        refresh();
                      });
                    },
                    child: Center(
                      child: Heading16("FINISH SURVEY", Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
