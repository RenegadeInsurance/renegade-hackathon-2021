import 'package:flutter/material.dart';

List heading = [
  "",
  "Alert Group",
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
        InkWell(
            onTap: () {
              // if (widget.isNotBackIcon) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               NotificationScreen(widget.refresh)));
              // }
            },
            child: widget.isNotBackIcon
                ? Container()
                : Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.asset("assets/19.png"),
                    ),
                  )),
      ],
    );
  }
}
