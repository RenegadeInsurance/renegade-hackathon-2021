import 'package:flutter/material.dart';
import 'package:hackathonfrontend/components/Presets.dart';

class Button extends StatelessWidget {
  final String Btext;

  final Function buttonFunction;
  final Color color;
  final IconData icon;

  Button(
    this.Btext,
    this.buttonFunction,
    this.color,
    this.icon,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  Btext,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
