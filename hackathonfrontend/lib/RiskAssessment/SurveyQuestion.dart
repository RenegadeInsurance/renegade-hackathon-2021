import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Entity/FAQ.dart';
import 'package:hackathonfrontend/Entity/UserAssessment.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';

import 'SurveyReport.dart';

class SurveyQuestion extends StatelessWidget {
  final List<FAQ> faqs;
  final int node;

  SurveyQuestion(this.faqs, this.node);

  @override
  Widget build(BuildContext context) {
    FAQ faq = faqs.firstWhere((element) => element.FAQID == node);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0B122F),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(3, false),
              SizedBox(
                height: 20,
              ),
              Text(
                faq.question,
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
                if (faq.yesNode == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SurveyReport(faq.yesRiskFactor);
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SurveyQuestion(faqs, faq.yesNode);
                      },
                    ),
                  );
                }
              }, Color(0xff6DA7FE), Icons.add, false),
              SizedBox(
                height: 10,
              ),
              Button("NO", () {

                if (faq.noNode == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SurveyReport(faq.noRiskFactor);
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SurveyQuestion(faqs, faq.noNode);
                      },
                    ),
                  );
                }
              }, Color(0xff6DA7FE), Icons.add, false),
              Expanded(child: Container()),
              Container(
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
                        svgImages[faq.riskAssessmentID],
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
                    Icon(
                      Icons.clear,
                      color: Colors.white,
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
