import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Services/LocationService.dart';
import 'package:hackathonfrontend/Services/PersonalCityService.dart';
import 'package:hackathonfrontend/Services/PersonalContactService.dart';
import 'package:hackathonfrontend/SignUp/DropdownCountry.dart';
import 'package:hackathonfrontend/Skeletons/DropdownSkeleton.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/data.dart';

class AddPersonalContact extends StatefulWidget {
  final Function _bringModal;
  final Function refresh;
  AddPersonalContact(this._bringModal, this.refresh);
  @override
  State<AddPersonalContact> createState() => _AddPersonalContactState();
}

class _AddPersonalContactState extends State<AddPersonalContact> {
  final TextEditingController _contactName = TextEditingController();
  final TextEditingController _relation = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xff182040),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      ),
      child: SizedBox(
        height: 400,
        width: 396,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "ADD NEW CONTACT",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: () {
                        widget._bringModal();
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                ],
              ),
              vSpace(20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (name) {
                        RegExp nameValid = RegExp('[a-zA-Z]');
                        if (name?.length == 0) {
                          return 'Name cannot not be empty';
                        } else if (!nameValid.hasMatch(name!)) {
                          return "Name must contain alphabets only";
                        }
                      },
                      decoration: textFieldDecoration("Name", "Name"),
                      controller: _contactName,
                    ),
                    vSpace(20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (rel) {
                        RegExp relValid = RegExp('[a-zA-Z]');
                        if (rel?.length == 0) {
                          return 'Relation must be provided';
                        } else if (!relValid.hasMatch(rel!)) {
                          return "Relation must contain alphabets only";
                        }
                      },
                      decoration: textFieldDecoration("Relation", "Relation"),
                      controller: _relation,
                    ),
                    vSpace(20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (email) {
                        RegExp emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (email?.length == 0) {
                          return 'Email cannot not be empty.';
                        } else if (!emailValid.hasMatch(email!)) {
                          return "Email id is not valid.";
                        }
                      },
                      decoration: textFieldDecoration("Email", "Email"),
                      controller: _email,
                    ),
                    vSpace(20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (phone) {
                        if (phone?.length != 10) {
                          return 'Mobile Number must be of 10 digit';
                        } else {
                          return null;
                        }
                      },
                      decoration: textFieldDecoration("Phone", "Phone"),
                      controller: _phone,
                    ),
                    vSpace(20),
                  ],
                ),
              ),
              Button("ADD CONTACT", () {
                if (_formKey.currentState!.validate()) {
                  PersonalContactService().postPersonalContact(relation:_relation.text, email: _email.text, phone: int.parse(_phone.text), isSelected: false, name: _contactName.text, userID: meUser!.userID).then((value) {
                    if (value) {
                      widget._bringModal();
                      widget.refresh(1);
                      widget.refresh(3);
                    }
                  });
                }
              }, Color(0xff6DA7FE), Icons.add, false)
            ],
          ),
        ),
      ),
    );
  }
}
