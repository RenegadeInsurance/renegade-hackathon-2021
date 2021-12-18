import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Services/LocationService.dart';
import 'package:hackathonfrontend/Services/PersonalCityService.dart';
import 'package:hackathonfrontend/SignUp/DropdownCountry.dart';
import 'package:hackathonfrontend/Skeletons/DropdownSkeleton.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/data.dart';

class AddNewCountry extends StatefulWidget {
  final Function refresh;
  AddNewCountry(this.refresh);

  @override
  State<AddNewCountry> createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewCountry> {
  String dropdownCountry = "Add a country";
  String dropdownState = "Add a state";
  String dropdownCity = "Add a city";

  final ExpandableController _expandableControllerCountry =
      ExpandableController(initialExpanded: false);
  final ExpandableController _expandableControllerState =
      ExpandableController(initialExpanded: false);

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
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(0xff182040),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
                        "ADD NEW COUNTRY",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          )),
                    ],
                  ),
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
                            future: CountryService()
                                .fetchStateService(dropdownCountry),
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
                                    future: CountryService()
                                        .fetchCityService(dropdownState),
                                    builder: (context, AsyncSnapshot snapshot) {
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
                      return DropdownSkeleton("Add a country");
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Button("ADD NEW CITY", () {
                    if (dropdownCountry != "Add a country" &&
                        dropdownState != "Add a state" &&
                        dropdownCity != "Add a city") {
                      PersonalCityService()
                          .postPersonalCity(meUser?.userID ?? 0,
                              dropdownCountry, dropdownState, dropdownCity)
                          .then((value) {
                        if (value) {
                          Navigator.pop(context);
                          widget.refresh();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("No Connection"),
                            ),
                          );
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill the dropdowns")));
                    }
                  }, Color(0xff6DA7FE), Icons.add, false)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
