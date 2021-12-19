import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownSkeleton extends StatelessWidget {
  final String hintText;

  DropdownSkeleton(this.hintText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff6DA7FE)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownSearch<String>(
          dropDownButton: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.grey,size: 30,
          ),
          showClearButton: false,
          mode: Mode.MENU,
          showSelectedItems: true,
          items: [],
          dropdownSearchDecoration: InputDecoration(
            hintText: "$hintText",
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(left: 12, top: 4),
            filled: false,
            border: InputBorder.none,
          ),
          showSearchBox: false,
          popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: (input) {},
        ),
      ),
    );
  }
}
