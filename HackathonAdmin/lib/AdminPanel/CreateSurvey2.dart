import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Button.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';

class CreateSurvey2 extends StatefulWidget {
  const CreateSurvey2({Key? key}) : super(key: key);

  @override
  _CreateSurvey2State createState() => _CreateSurvey2State();
}

class _CreateSurvey2State extends State<CreateSurvey2> {
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
                          "Please double-check the risk value and the link to the new section.",
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
                                        vSpace(10),
                                        Heading12("Have you experienced one or more flooding events in your life ?", Colors.grey),
                                        vSpace(10),
                                        Table(
                                            defaultColumnWidth: FixedColumnWidth(120.0),
                                            border: TableBorder.all(
                                                color: Colors.black,
                                                style: BorderStyle.solid,
                                                width: 1),
                                            children: [
                                              TableRow(
                                                  children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("Response" ,Colors.grey ),]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("Risk value" ,Colors.grey )]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[ Heading12("Linked to" ,Colors.grey )]),
                                                ),
                                              ]),
                                              TableRow( children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("No" ,Colors.grey ),]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("10%" ,Colors.grey )]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[ Heading12("Question 3" ,Colors.grey )]),
                                                ),
                                              ]),
                                              TableRow( children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("Yes" ,Colors.grey ),]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(children:[Heading12("50%" ,Colors.grey )]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(

                                                      children:[ Heading12("Question 4" ,Colors.grey )]),
                                                ),
                                              ]),
                                            ]),



                                      ],
                                    ),
                                  ),

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


                  vSpace(10),
                  Button("ADD NEW FIELD", () {
                    // if (_formKey.currentState!.validate()) {}
                  }, Color(0xff6DA7FE), Icons.add, false)
                ],),
              )
            ],
          ),
        ));
  }
}
