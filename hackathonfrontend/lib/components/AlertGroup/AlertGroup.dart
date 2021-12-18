import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Presets.dart';

class AlertGroup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0B122F),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12,
          bottom: 12,
        ),
        child: ListView(
          children: [
            SizedBox(height: 12,),
            Header(1, false),
            SizedBox(
              height: 20,
            ),
            Heading14("Your Personal Contacts", Colors.white),
            Column(
              children: [
                [
                  "1st",
                  "John Mayer",
                  "Brother",
                  "9803312344",
                  "john@gmail.com"
                ],
                [
                  "2nd",
                  "John Doe",
                  "Friend",
                  "9804412314",
                  "john.doe@gmail.com"
                ],
                [
                  "3rd",
                  "Jessica Mills",
                  "Cousin",
                  "9801412311",
                  "jessica@gmail.com"
                ]
              ]
                  .map(
                    (e) => Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          // height: 174,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius12(),
                            boxShadow: customBoxShadow(),
                            color: Color(0xff182040),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12, left: 12, right: 12, bottom: 6),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow,
                                      ),
                                      child: Center(
                                        child: Text(
                                          getInitials(e[1]),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Heading14(
                                          e[1],
                                          Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Heading14(
                                          e[2],
                                          Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Heading14(
                                      e[0],
                                      Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 6, left: 12, right: 12, bottom: 6),
                                child: InkWell(
                                  onTap: () => e[4] == "-1"
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Phone number is not assigned.")))
                                      : launch("mailto:${e[4]}"),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/email.svg"),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Heading12(e[4], Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 6, left: 12, right: 12, bottom: 12),
                                child: InkWell(
                                  onTap: () => e[3].toString() == "-1"
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Phone number is not assigned.")))
                                      : launch("tel:+977${e[3].toString()}"),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/phone.svg"),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Heading12(e[3], Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              height: 174,
              decoration: BoxDecoration(
                borderRadius: borderRadius12(),
                boxShadow: customBoxShadow(),
                color: Color(0xff182040),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "assets/akar-icons_plus.svg",
                        height: 60,
                        width: 60,
                        color: Color(0xff6DA7FE),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Heading12("ADD NEW MEMBER", Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    ));
  }
}
