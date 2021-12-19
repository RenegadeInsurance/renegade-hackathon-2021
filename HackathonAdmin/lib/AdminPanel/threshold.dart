import 'package:flutter/material.dart';
import 'package:hackathon/Header/Header.dart';
import 'package:hackathon/components/Presets.dart';
import 'package:hackathon/components/texts.dart';
class ThresholdPage extends StatefulWidget {
  const ThresholdPage({Key? key}) : super(key: key);

  @override
  _ThresholdPageState createState() => _ThresholdPageState();
}

class _ThresholdPageState extends State<ThresholdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B122F),

      body: Form(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(2, true),
            vSpace(12),
            Heading14("BASIC CONFIGURATION", Colors.grey),
            TextFormField(

              enableSuggestions: true,
              validator: (email) {
                RegExp emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (email == null || email.isEmpty) {
                  return 'Please enter your email';
                } else if (!emailValid.hasMatch(email)) {
                  return "Please enter valid email";
                }
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                hintText: "Threshold Value",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
            ///
            ///
            TextFormField(

              enableSuggestions: true,
              validator: (email) {
                RegExp emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (email == null || email.isEmpty) {
                  return 'Please enter your email';
                } else if (!emailValid.hasMatch(email)) {
                  return "Please enter valid email";
                }
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                hintText: "Water level",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(

              enableSuggestions: true,
              validator: (email) {
                RegExp emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (email == null || email.isEmpty) {
                  return 'Please enter your email';
                } else if (!emailValid.hasMatch(email)) {
                  return "Please enter valid email";
                }
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    BorderSide(color: Color(0xff6DA7FE))),
                hintText: "Water level",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
