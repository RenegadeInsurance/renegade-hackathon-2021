import 'package:flutter/material.dart';

List heading = [
  "",
  "Current Surveys",
  "Risk Assessment",
  "Flood Risk Assessment",
  "Sign Up",
];

class Header extends StatefulWidget {
  final int index;
  final bool isNotBackIcon;

  Header(
    this.index,
    this.isNotBackIcon,
  );

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isNotBackIcon
            ? SizedBox(
                width: 12,
              )
            : InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
        SizedBox(
          width: 20,
        ),
        Text(
          heading[widget.index],
          style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.none,
              color: Colors.white),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
