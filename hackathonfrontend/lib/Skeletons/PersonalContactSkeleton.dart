import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalContactSkeleton extends StatelessWidget {
  const PersonalContactSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(

      gradient: LinearGradient(
          colors: [Colors.grey.withOpacity(0.2), Color(0xff9AA0BDFF).withOpacity(0.2)]),
      child: Column(
        children: [
          const SizedBox(
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
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 12,
                      right: 12,
                      bottom: 6),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
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
                            "",
                            Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Heading14(
                            "",
                            Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Heading14(
                        "",
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
                      top: 6,
                      left: 12,
                      right: 12,
                      bottom: 6),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          "assets/email.svg"),
                      SizedBox(
                        width: 12,
                      ),
                      Heading12("", Colors.grey),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 6,
                      left: 12,
                      right: 12,
                      bottom: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          "assets/phone.svg"),
                      SizedBox(
                        width: 12,
                      ),
                      Heading12("", Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
