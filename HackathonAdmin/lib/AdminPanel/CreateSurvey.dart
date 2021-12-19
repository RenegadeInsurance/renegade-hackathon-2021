import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/AdminPanel/CreateSurvey2.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Button.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';

class CreateSurvey extends StatefulWidget {
  const CreateSurvey({Key? key}) : super(key: key);

  @override
  _CreateSurveyState createState() => _CreateSurveyState();
}

class _CreateSurveyState extends State<CreateSurvey> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController question = TextEditingController();
  final TextEditingController percent = TextEditingController();
  final TextEditingController percent1 = TextEditingController();

  final TextEditingController percent2 = TextEditingController();
  final TextEditingController percent3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0B122F),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    Column(
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
                                      "Question 1 ",
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
                                      controller: question,
                                      decoration: textFieldDecoration(
                                          "Question", "Question"),
                                    ),
                                    vSpace(20),
                                    Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Color(0xff6DA7FE)),
                                            ),
                                            child: Center(
                                                child: Heading16(
                                                    "Yes", Colors.grey))),
                                        hSpace(10),
                                        Container(
                                          height: 50,
                                          width: 70,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            validator: (per) {
                                              if (per?.length == 0) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Please fill remaining field")));
                                              } else if ((int.parse(per!) <
                                                      0) ||
                                                  (int.parse(per) > 100)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Range must be 0 to 100")));
                                              }
                                            },
                                            controller: percent1,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff6DA7FE))),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff6DA7FE))),
                                              hintText: "20%",
                                              hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: DropdownSearch<String>(
                                                dropDownButton: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                ),
                                                dropdownSearchBaseStyle:
                                                    TextStyle(
                                                        color: Colors.white),
                                                showClearButton: false,
                                                mode: Mode.MENU,
                                                showSelectedItems: true,
                                                items: [
                                                  "Male",
                                                  "Female",
                                                  "Transgender",
                                                  "Others",
                                                ],
                                                dropdownSearchDecoration:
                                                    const InputDecoration(
                                                  focusColor: Colors.white,
                                                  hintText: "Gender",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 12, top: 4),
                                                  filled: false,
                                                  border: InputBorder.none,
                                                ),
                                                showSearchBox: false,
                                                popupItemDisabled: (String s) =>
                                                    s.startsWith('I'),
                                                onChanged: (input) {},
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
                                              border: Border.all(
                                                  color: Color(0xff6DA7FE)),
                                            ),
                                            child: Center(
                                                child: Heading16(
                                                    "No", Colors.grey))),
                                        hSpace(10),
                                        Container(
                                          height: 50,
                                          width: 70,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            validator: (per) {
                                              if (per?.length == 0) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Please fill remaining field")));
                                              } else if ((int.parse(per!) <
                                                      0) ||
                                                  (int.parse(per) > 100)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Range must be 0 to 100")));
                                              }
                                            },
                                            controller: percent3,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff6DA7FE))),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff6DA7FE))),
                                              hintText: "20%",
                                              hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: DropdownSearch<String>(
                                                dropDownButton: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                ),
                                                dropdownSearchBaseStyle:
                                                    TextStyle(
                                                        color: Colors.white),
                                                showClearButton: false,
                                                mode: Mode.MENU,
                                                showSelectedItems: true,
                                                items: [
                                                  "Male",
                                                  "Female",
                                                  "Transgender",
                                                  "Others",
                                                ],
                                                dropdownSearchDecoration:
                                                    const InputDecoration(
                                                  focusColor: Colors.white,
                                                  hintText: "Gender",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 12, top: 4),
                                                  filled: false,
                                                  border: InputBorder.none,
                                                ),
                                                showSearchBox: false,
                                                popupItemDisabled: (String s) =>
                                                    s.startsWith('I'),
                                                onChanged: (input) {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button("ADD NEW FIELD", () {
                                  if (_formKey.currentState!.validate()) {}
                                }, Color(0xff6DA7FE), Icons.add, false),
                              )
                            ],

                            ///
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [

              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: borderRadius12()),
                child: Material(
                  color: Color(0xff0B122F),


                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: Color(0xff6DA7FE)),
                      ),

                      child:
                      Row(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) {
                      return CreateSurvey2();
                    }));
              }, Color(0xff6DA7FE), Icons.add, false)
            ],),
          )
        ],
      ),
    ));
  }
}
