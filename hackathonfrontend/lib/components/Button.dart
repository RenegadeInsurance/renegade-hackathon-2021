import 'package:flutter/material.dart';
import 'package:hackathonfrontend/components/Presets.dart';

class Button extends StatelessWidget {
  final String Btext;

  final Function buttonFunction;
  final Color color;
  final IconData icon;
  final bool isNotIcon;

  Button(
    this.Btext,
    this.buttonFunction,
    this.color,
    this.icon, this.isNotIcon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: borderRadius12()),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            buttonFunction();
          },
          child: Container(
            height: 50,
            color: color,
            child:
            isNotIcon ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  Btext,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Btext,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
