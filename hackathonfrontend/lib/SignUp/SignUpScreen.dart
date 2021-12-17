import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Skeletons/DropdownSkeleton.dart';
import 'package:hackathonfrontend/components/Button.dart';

import '../SurveyScreen.dart';
import '../components/texts.dart';
import 'DropdownCountry.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controller = TextEditingController();

  String dropdownValue = 'Male';
  String dropdownCountry = "Add a country";
  String dropdownState = "Add a state";
  String dropdownCity = "Add a city";
  ExpandableController _expandableControllerCountry =
  ExpandableController(initialExpanded: false);
  ExpandableController _expandableControllerState =
  ExpandableController(initialExpanded: false);


  void _changedDropdown(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }

  void _changeCountry(String newValue) {
    setState(() {
      dropdownCountry = newValue;
      _expandableControllerCountry.expanded = true;
    });
  }

  void _changeState(String newValue) {
    setState(() {
      dropdownState = newValue;
      _expandableControllerState.expanded = true;
    });
  }

  void _changeCity(String newValue) {
    setState(() {
      dropdownCity = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Center(
                child: Heading1("WEAS",Colors.black),
              ),
              Heading4("Sign Up"),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        'Name',
                        "Email",
                        "Age",
                      ]
                          .map(
                            (e) =>
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12,
                              ),
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  labelText: e,
                                  hintText: e,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        height: 59,
                        width: 230,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownSearch<String>(
                          showClearButton: false,
                          mode: Mode.MENU,
                          showSelectedItems: true,
                          items: ["Male", "Female", "Transgender", "Others"],
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Gender",
                            contentPadding: EdgeInsets.only(left: 12, top: 4),
                            filled: false,
                            border: InputBorder.none,
                          ),
                          showSearchBox: false,
                          popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (input) {
                            _changedDropdown(dropdownValue);
                          },
                        ),
                      ),
                    ),
                    Heading4(
                        "-------------------------- Location ------------------------"),
                    FutureBuilder(

                      future: CountryService().fetchCountryService(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<String> allCountries = snapshot.data;
                          return ExpandablePanel(
                            controller: _expandableControllerCountry,
                            header: DropdownCountry(
                              items: allCountries,
                              hintText: 'Add a country',
                              onchanged: _changeCountry,
                              selectedItem: dropdownCountry,
                            ),
                            expanded: FutureBuilder(
                              future: CountryService().fetchStateService(
                                  dropdownCountry),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  List<String> allStates = snapshot.data;
                                  return ExpandablePanel(
                                    controller: _expandableControllerState,
                                    header: DropdownCountry(
                                      items: allStates,
                                      hintText: 'Add a state',
                                      onchanged: _changeState,
                                      selectedItem: dropdownState,

                                    ),
                                    expanded: FutureBuilder(
                                      future:CountryService().fetchCityService(dropdownState),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {

                                        if (snapshot.hasData) {
                                          List<String> allCities = snapshot.data;
                                          return DropdownCountry(
                                            items: allCities,
                                            hintText: 'Add a city',
                                            onchanged: _changeCity,
                                            selectedItem: dropdownCity,
                                          );
                                        }
                                        return DropdownSkeleton("Add a City");
                                      },
                                    ),
                                    collapsed: Container(),
                                  );
                                }
                                return DropdownSkeleton("Add a state");
                              },
                            ),
                            collapsed: Container(),
                          );
                        }
                        return DropdownSkeleton
                          (
                            "Add a country"
                        );
                      },
                    ),
                  ],
                ),
              ),
              Button("CONTINUE", () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return SurveyScreen();
                }));
              }, Colors.green, Icons.arrow_forward_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
