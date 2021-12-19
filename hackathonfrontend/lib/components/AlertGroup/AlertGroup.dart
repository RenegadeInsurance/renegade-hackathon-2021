import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathonfrontend/Entity/PersonalContact.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/Services/InitiateThreshold.dart';
import 'package:hackathonfrontend/Services/PersonalContactService.dart';
import 'package:hackathonfrontend/SignUp/ThresholdBox.dart';
import 'package:hackathonfrontend/Skeletons/PersonalContactSkeleton.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:hackathonfrontend/data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Presets.dart';

class AlertGroup extends StatefulWidget {
  final Function setBottomBarIndex;
  final Function _bringModal;

  AlertGroup(this.setBottomBarIndex, this._bringModal);

  @override
  State<AlertGroup> createState() => _AlertGroupState();
}

class _AlertGroupState extends State<AlertGroup> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        widget.setBottomBarIndex(1);
        return Future.value(false);
      },
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
              SizedBox(
                height: 12,
              ),
              Header(1, false),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: PersonalContactService().fetchPersonalContacts().then((value) => value.where((element) => element.userID == meUser!.userID).toList()),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<PersonalContact> personalContacts = snapshot.data;
                      int counter = 0;
                      personalContacts.forEach((element) {
                        if (element.isSelected) {
                          counter++;
                        }
                      });
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Heading14(
                                  "$counter Personal Contacts will be Notified",
                                  Colors.white),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                      return ThresholdBox();
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Threshold",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: personalContacts
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
                                            Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      borderRadius12()),
                                              child: Material(
                                                color: Color(0xff182040),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (e.isSelected) {
                                                      PersonalContactService()
                                                          .updatePersonalContact(
                                                            PersonalContact(
                                                                e.personalContactID,
                                                                meUser!.userID,
                                                                e.name,
                                                                e.relation,
                                                                e.email,
                                                                e.phone,
                                                                !e.isSelected),
                                                          )
                                                          .then((value) =>
                                                              setState(() {}));
                                                    } else {
                                                      int count = 0;
                                                      for (var element
                                                          in personalContacts) {
                                                        if (element
                                                            .isSelected) {
                                                          count++;
                                                        }
                                                      }
                                                      if (count >= 3) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                "You can not select more than three contact"),
                                                          ),
                                                        );
                                                      } else {
                                                        PersonalContactService()
                                                            .updatePersonalContact(
                                                              PersonalContact(
                                                                  e.personalContactID,
                                                                  meUser!.userID,
                                                                  e.name,
                                                                  e.relation,
                                                                  e.email,
                                                                  e.phone,
                                                                  !e.isSelected),
                                                            )
                                                            .then((value) =>
                                                                setState(
                                                                    () {}));
                                                      }
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
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
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.1),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white)),
                                                          child: Center(
                                                            child: Text(
                                                              getInitials(
                                                                  e.name),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 25),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Heading14(
                                                                  e.name,
                                                                  Colors.white,
                                                                ),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                e.isSelected
                                                                    ? Container(
                                                                        padding:
                                                                            EdgeInsets.all(6),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xff2a7d1e),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "Selected",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 12),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        padding:
                                                                            EdgeInsets.all(6),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.white),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "Select",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 12),
                                                                          ),
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Heading14(
                                                              e.relation,
                                                              Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
                                              child: InkWell(
                                                onTap: () => e.email == "-1"
                                                    ? ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Phone number is not assigned.")))
                                                    : launch(
                                                        "mailto:${e.email}"),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/email.svg"),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Heading12(
                                                        e.email, Colors.grey),
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
                                                  top: 6,
                                                  left: 12,
                                                  right: 12,
                                                  bottom: 12),
                                              child: InkWell(
                                                onTap: () => e.phone
                                                            .toString() ==
                                                        "-1"
                                                    ? ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              "Phone number is not assigned."),
                                                        ),
                                                      )
                                                    : launch(
                                                        "tel:+977${e.phone.toString()}"),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/phone.svg"),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Heading12(
                                                        e.phone.toString(),
                                                        Colors.grey),
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
                        ],
                      );
                    }
                    return Column(
                      children: ["", "", ""]
                          .map(
                            (e) => PersonalContactSkeleton(),
                          )
                          .toList(),
                    );
                  }),
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
                  onPressed: () {
                    // showModalBottomSheet(
                    //
                    //   context: context,
                    //   builder: (_) {
                    //     return AddPersonalContact();
                    //   },
                    //   backgroundColor: Colors.transparent,
                    //   enableDrag: true,
                    //   clipBehavior: Clip.none,
                    // );
                    widget._bringModal();
                  },
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
      ),
    ));
  }
}
