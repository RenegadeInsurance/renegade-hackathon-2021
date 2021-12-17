import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/components/texts.dart';

import '../Presets.dart';

class AlertGroup extends StatelessWidget {
  const AlertGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0B122F),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(1, false),
                SizedBox(height: 20,),
                Heading3("Your Personal Contacts", Colors.white),
                SizedBox(height: 12,),
                Container(
                  padding: EdgeInsets.all(12),
                  // height: 174,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius12(),
                    boxShadow: customBoxShadow(),
                    color: Color(0xff182040),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Heading2(
                                "Good Afternoon!",
                                Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Heading1(
                                "Hilife Team",
                                Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}
