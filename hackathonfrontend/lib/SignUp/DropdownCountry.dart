import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownCountry extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final Function onchanged;
  final String hintText;

  DropdownCountry(
      {required this.items,
      required this.selectedItem,
      required this.onchanged,
      required this.hintText});

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
        child: Theme(
          data: (ThemeData(
            textTheme: TextTheme(
              subtitle1: TextStyle(
                color: Color(0xff6DA7FE),
              ),
            ),
          )),
          child: DropdownSearch<String>(
            dropDownButton: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            showClearButton: false,
            mode: Mode.MENU,
            selectedItem: selectedItem,
            showSelectedItems: true,
            items: items,
            dropdownSearchDecoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(left: 12, top: 4),
              filled: false,
              border: InputBorder.none,
            ),
            showSearchBox: false,
            popupItemDisabled: (String s) => s.startsWith('I'),
            onChanged: (input) {
              onchanged(input);
            },
          ),
        ),
      ),
    );
  }
}
