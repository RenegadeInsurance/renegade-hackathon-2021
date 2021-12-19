import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(borderRadius: BorderRadius.circular(12));
}

List<BoxShadow> customBoxShadow() {
  return [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 3,
        spreadRadius: 3,
        color: Colors.black.withOpacity(0.1))
  ];
}

BorderRadius borderRadius12() {
  return BorderRadius.circular(12);
}

///Vertical space
vSpace(double h) {
  return SizedBox(
    height: h,
  );
}

///horizontal space
hSpace(double h) {
  return SizedBox(
    width: h,
  );
}

/// text field decoration
textFieldDecoration(String label, String hint) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Color(0xff6DA7FE)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Color(0xff6DA7FE),
      ),
    ),

    contentPadding: EdgeInsets.only(left: 12, top: 4),
    // labelText: label,
    hintStyle: TextStyle(color: Colors.grey),
    hintText: hint,
    labelStyle: TextStyle(color: Colors.grey),
  );
}

String getInitials(String name){
  if (name.split(" ").length >= 2) {
    return name.split(" ")[0].substring(0, 1).toUpperCase() +
        name.split(" ")[1].substring(0, 1).toUpperCase();
  } else if (name.split(" ").length == 1) {
    return name.split(" ")[0].substring(0, 1).toUpperCase();
  } else {
    return "-";
  }
}
