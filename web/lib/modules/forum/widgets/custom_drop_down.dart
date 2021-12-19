import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';

class CustomDropDown extends StatelessWidget {
  final String hintext;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? value;
  const CustomDropDown({
    Key? key,
    required this.hintext,
    this.onChanged,
    this.value,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.signupTextFieldInputBorder),
          color: ColorConstants.signupTextFieldBackground),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(
            FontAwesomeIcons.chevronDown,
            size: 20,
            color: Color(0xffA2A9B0),
          ),
          hint: Text(
            hintext,
            style: const TextStyle(
                fontSize: 20, letterSpacing: 0.4, color: Color(0xffA2A9B0)),
          ),
          isExpanded: true,
          value: value,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
