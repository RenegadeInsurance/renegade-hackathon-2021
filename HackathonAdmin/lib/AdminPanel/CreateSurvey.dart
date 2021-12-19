import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/Entity/FAQService.dart';
import 'package:hackathon/Entity/RiskAssessmentService.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Button.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';

import 'SingularSurvey.dart';

class CreateSurvey extends StatefulWidget {
  const CreateSurvey({Key? key}) : super(key: key);

  @override
  _CreateSurveyState createState() => _CreateSurveyState();
}

class _CreateSurveyState extends State<CreateSurvey> {
  List<TextEditingController> question =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> percent =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> percent1 =
      List.generate(1, (index) => TextEditingController());

  List<int> yesNodes = List.generate(1, (index) => 0);
  List<int> noNodes = List.generate(1, (index) => 0);
  List<int> count = List.generate(1, (index) => index).toList();
  List<List<int>> dropdownIndex = List.generate(1, (index) => [0, 0]).toList();

  changeDropdown(int i, int j, int newValue) {
    dropdownIndex[i][j] = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0B122F),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(children: [
                Header(1, false),

                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please assign a risk value to each response and connect it to the next question.",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // height: 174,

                ...count
                    .map(
                      (e) => SingularSurvey(
                        e,
                        question[e],
                        percent[e],
                        percent1[e],
                        yesNodes[e],
                        noNodes[e],
                        count,
                        changeDropdown,
                      ),
                    )
                    .toList(),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: borderRadius12()),
                  child: Material(
                    color: Color(0xff0B122F),
                    child: InkWell(
                      onTap: () {
                        count.add(count.length);
                        question.add(TextEditingController());
                        percent.add(TextEditingController());
                        percent1.add(TextEditingController());
                        dropdownIndex.add([0, 0]);
                        yesNodes.add(0);
                        noNodes.add(0);
                        setState(() {});
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xff6DA7FE)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ADD NEW QUESTION",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                vSpace(10),
                Button("CONTINUE", () {
                  // RiskAssessmentService()
                  //     .postRiskAssessment("Assessment", "remarks")
                  //     .then((value) {
                  //   count.forEach((index) {
                  //     FAQService().postFAQ(
                  //         value,
                  //         percent[index],
                  //         percent1[index],
                  //         question[index],
                  //         yesNodes[index],
                  //         noNodes[index],
                  //         index == 0 ? true : false);
                  //   });
                  // });
                }, Color(0xff6DA7FE), Icons.add, false)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
