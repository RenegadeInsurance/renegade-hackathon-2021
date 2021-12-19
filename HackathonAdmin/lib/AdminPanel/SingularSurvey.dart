import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Button.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';

class SingularSurvey extends StatefulWidget {
  final int index;
  final TextEditingController question;

  final TextEditingController percent;

  final TextEditingController percent1;

  final int yesNode;

  final int noNode;
  final List<int> allQuestions;
  final Function changeDropdown;

  const SingularSurvey(this.index, this.question, this.percent, this.percent1,
      this.yesNode, this.noNode, this.allQuestions, this.changeDropdown,);

  @override
  State<SingularSurvey> createState() => _SingularSurveyState();
}

class _SingularSurveyState extends State<SingularSurvey> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Question ${widget.index+1} ",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12),
                        ),
                        vSpace(20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (que) {
                            if (que?.length == 0) {
                              return 'Question must be provided';
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: widget.question,
                          decoration:
                              textFieldDecoration("Question", "Question"),
                        ),
                        vSpace(20),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Color(0xff6DA7FE)),
                                ),
                                child: Center(
                                    child: Heading16("Yes", Colors.grey))),
                            hSpace(10),
                            Container(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                validator: (per) {
                                  if (per?.length == 0) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                "Please fill remaining field")));
                                  } else if ((int.parse(per!) < 0) ||
                                      (int.parse(per) > 100)) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                "Range must be 0 to 100")));
                                  }
                                },
                                controller: widget.percent,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Color(0xff6DA7FE))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Color(0xff6DA7FE))),
                                  hintText: "20%",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            hSpace(10),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6DA7FE),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Theme(
                                    data: (ThemeData(
                                      textTheme: TextTheme(
                                        subtitle1: TextStyle(
                                          color: Color(0xff6DA7FE),
                                        ),
                                      ),
                                    )),
                                    child: DropdownSearch<String>(
                                      dropDownButton: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                      dropdownSearchBaseStyle:
                                          TextStyle(color: Colors.white),
                                      showClearButton: false,
                                      mode: Mode.MENU,
                                      showSelectedItems: true,
                                      items: widget.allQuestions
                                          .map((e) => "Question $e")
                                          .toList(),
                                      dropdownSearchDecoration:
                                          const InputDecoration(
                                        hintText: "Gender",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        contentPadding:
                                            EdgeInsets.only(left: 12, top: 4),
                                        filled: false,
                                        border: InputBorder.none,
                                      ),
                                      popupBackgroundColor: Color(0xff0B122F),
                                      showSearchBox: false,
                                      popupItemDisabled: (String s) =>
                                          s.startsWith('I'),
                                      onChanged: (input) {
                                        widget.changeDropdown(
                                            widget.index,
                                            0,
                                            int.parse((input ?? "Question 0")
                                                .substring(
                                                    (input ?? "Question 0")
                                                            .length -
                                                        1,
                                                    (input ?? "Question 0")
                                                        .length)));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        vSpace(20),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius12(),
                                  border:
                                      Border.all(color: Color(0xff6DA7FE)),
                                ),
                                child: Center(
                                    child: Heading16("No", Colors.grey))),
                            hSpace(10),
                            Container(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                validator: (per) {
                                  if (per?.length == 0) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                "Please fill remaining field")));
                                  } else if ((int.parse(per!) < 0) ||
                                      (int.parse(per) > 100)) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                "Range must be 0 to 100")));
                                  }
                                },
                                controller: widget.percent1,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Color(0xff6DA7FE))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: Color(0xff6DA7FE))),
                                  hintText: "20%",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            hSpace(10),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6DA7FE),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Theme(
                                    data: (ThemeData(
                                      textTheme: TextTheme(
                                        subtitle1: TextStyle(
                                          color: Color(0xff6DA7FE),
                                        ),
                                      ),
                                    )),
                                    child: DropdownSearch<String>(
                                      dropDownButton: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                      dropdownSearchBaseStyle:
                                          TextStyle(color: Colors.white),
                                      showClearButton: false,
                                      mode: Mode.MENU,
                                      showSelectedItems: true,
                                      items: widget.allQuestions
                                          .map((e) => "Question $e")
                                          .toList(),
                                      dropdownSearchDecoration:
                                          const InputDecoration(
                                        focusColor: Colors.white,
                                        hintText: "Gender",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        contentPadding:
                                            EdgeInsets.only(left: 12, top: 4),
                                        filled: false,
                                        border: InputBorder.none,
                                      ),
                                      showSearchBox: false,
                                      popupItemDisabled: (String s) =>
                                          s.startsWith('I'),
                                      onChanged: (String? input) {
                                        widget.changeDropdown(
                                            widget.index,
                                            1,
                                            int.parse((input ?? "Question 0")
                                                .substring(
                                                    (input ?? "Question 0")
                                                            .length -
                                                        1,
                                                    (input ?? "Question 0")
                                                        .length)));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
