import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(borderRadius: BorderRadius.circular(12));
}

List<BoxShadow> customBoxShadow() {
  return [BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 3,
      spreadRadius: 3,
      color: Colors.black.withOpacity(0.1))];
}

BorderRadius borderRadius12() {
  return BorderRadius.circular(12);
}


///Vertical space
vspace30() {
  return const SizedBox(
    height: 30,
  );

}
///horizontal space
hspace20() {
  return const SizedBox(
    width: 20,
  );
}
