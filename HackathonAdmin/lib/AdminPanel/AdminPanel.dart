import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/AdminPanel/CreateSurvey.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff0B122F),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(1, false),

                        SizedBox(
                          height: 20,
                        ),
                        Heading12("Risk Assessment Survey", Colors.white),
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
                                                child: SvgPicture.asset("flood.svg", height: 20,
                                                  width: 20,)



                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Heading14(
                                              "Flood Risk Assessment ",
                                              Colors.white,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "10 Question ",
                                              style: TextStyle(
                                                  color:
                                                      Colors.white.withOpacity(0.5),
                                                  fontSize: 12),
                                            ),
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
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Heading14(
                                                  "EDIT", Color(0xff6DA7FE)),
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
                                      "You will be asked 10 different questions in this survey, and you will be asked more questions based on your answersto the prior questions.",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),

                                ],///
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),

                      ]),
                ),
                Spacer(),
                Container(
                  height: 70,
                  width: double.infinity,
                  color:Color(0xff182040) ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){  Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                            return CreateSurvey();
                          }));

                      },
                      child: Container(
                          height: 50,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all( color: Color(0xffDDDDDD)),

                            color: Color(0xff182040),
                          ),
                          child: Center(
                           child: Icon(Icons.add,color: Colors.grey,),
                          )),
                    ),
                  ),
                ),
              ],
            ),
        ));
  }
}
