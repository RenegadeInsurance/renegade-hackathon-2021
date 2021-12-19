import 'package:flutter/material.dart';
class Threshold extends StatefulWidget {
  const Threshold({Key? key}) : super(key: key);

  @override
  _ThresholdState createState() => _ThresholdState();
}

class _ThresholdState extends State<Threshold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        child:  Column(
          children: [
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
          ],

        ),
      ),
    );
  }
}
