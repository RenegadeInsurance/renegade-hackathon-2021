import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Header/Header.dart';
import 'package:hackathonfrontend/LogIn/LogInScreen.dart';
import 'package:hackathonfrontend/Services/CountryService/CountryService.dart';
import 'package:hackathonfrontend/Services/LocationService.dart';
import 'package:hackathonfrontend/Services/UserService.dart';
import 'package:hackathonfrontend/Skeletons/DropdownSkeleton.dart';
<<<<<<< HEAD
=======
import 'package:hackathonfrontend/WeatherForecast/Dashboard.dart';
>>>>>>> 62de74542b6af46d7b5f7470929bf9f3861ace69
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/Presets.dart';
import 'package:hackathonfrontend/components/texts.dart';

import 'DropdownCountry.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String dropdownGender = 'Gender';
  String dropdownCountry = "Add a country";
  String dropdownState = "Add a state";
  String dropdownCity = "Add a city";

  final ExpandableController _expandableControllerCountry =
      ExpandableController(initialExpanded: false);
  final ExpandableController _expandableControllerState =
      ExpandableController(initialExpanded: false);

  final _formKey = GlobalKey<FormState>();

  void _changedDropdown(String newValue) {
    setState(() {
      dropdownGender = newValue;
    });
  }

  Widget _customDropDownAddress(
    BuildContext context,
    String itemDesignation,
    _addressFilteredName,
  ) {
    return Container(
        child: Text(itemDesignation.toString(),
            style: TextStyle(
              fontSize: 10,
              color: Colors.green,
            )));
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
        backgroundColor: Color(0xff0B122F),
        body: PageView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Heading14(
                      "PERSONAL DETAILS",
                      Colors.white,
                    ),
                    Heading14(
                      "Sign Up",
                      Colors.black,
                    ),
                    vSpace(20),
                    Expanded(
                      child: ListView(children: [
                        Column(
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
                              decoration: textFieldDecoration(
                                "Name",
                                "Name",
                              ),
                              controller: nameController,
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
                              controller: emailController,
                            ),
                            vSpace(20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: (pwd) {
                                if (pwd?.length == 0) {
                                  return 'Password cannot not be empty';
                                } else if (pwd!.length < 8) {
                                  return "Password must be atleast of 8 characters";
                                }
                              },
                              obscureText: true,
                              decoration:
                                  textFieldDecoration("Password", "Password"),
                              controller: pwdController,
                            ),
                            vSpace(20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    validator: (age) {
                                      if (age?.length == 0) {
                                        return 'Age cannot not be empty.';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: textFieldDecoration("Age", "Age"),
                                    controller: ageController,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff6DA7FE),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Theme(
                                      data: ThemeData(
                                        textTheme: TextTheme(
                                          subtitle1: TextStyle(
                                            color: Color(0xff6DA7FE),
                                          ),
                                        ),
                                      ),
                                      child: DropdownSearch<String>(
                                        dropDownButton: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                        dropdownSearchBaseStyle:
                                            TextStyle(color: Colors.white),
                                        showClearButton: false,
                                        mode: Mode.MENU,
                                        showSelectedItems: true,
                                        items: [
                                          "Male",
                                          "Female",
                                          "Transgender",
                                          "Others",
                                        ],
                                        dropdownSearchDecoration:
                                            const InputDecoration(
                                          focusColor: Colors.white,
                                          hintText: "Gender",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          contentPadding:
                                              EdgeInsets.only(left: 12, top: 4),
                                          filled: false,
                                          border: InputBorder.none,
                                        ),
                                        showSearchBox: false,
                                        popupItemDisabled: (String s) =>
                                            s.startsWith('I'),
                                        onChanged: (input) {
                                          _changedDropdown(dropdownGender);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Heading14(
                                  "LOCATION DETAILS",
                                  Colors.white,
                                ),
                              ],
                            ),
                            vSpace(10),
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
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  List<String> allCities =
                                                      snapshot.data;
                                                  return DropdownCountry(
                                                    items: allCities,
                                                    hintText: 'Add a city',
                                                    onchanged: _changeCity,
                                                    selectedItem: dropdownCity,
                                                  );
                                                }
                                                return DropdownSkeleton(
                                                    "Add a City");
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
                          ],
                        ),
                      ]),
                    ),
                    Button("CONTINUE", () {
                      if (_formKey.currentState!.validate()) {
                        LocationService()
                            .postLocation(
                                dropdownCountry, dropdownState, dropdownCity)
                            .then((value) {
                          if (value != -1) {
                            (UserService()
                                .postUser(
                                    value,
                                    nameController.text,
                                    emailController.text,
                                    int.parse(ageController.text),
                                    dropdownGender,
                                    pwdController.text)
                                .then(
                              (value) {
                                if (value == "success") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Sign up successful, Please login to proceed"),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return LogInScreen();
                                      },
                                    ),
                                  );
                                } else if (value == "exists") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Email already taken"),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("No internet connection"),
                                    ),
                                  );
                                }
                              },
                            ));
                          }
                        });
                        // UserService().postUser(locationID, nameController.text, emailController.text, int.parse(ageController.text), dropdownGender, pwdController.text);

                      }
                    }, Color(0xff6DA7FE), Icons.arrow_forward_outlined, false),
                  ],
                ),
              ),
<<<<<<< HEAD
            ),
            LogInScreen(),
          ],
=======
              Button("CONTINUE", () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return WeatherForecast();
                }));
              }, Colors.green, Icons.arrow_forward_outlined),
            ],
          ),
>>>>>>> 62de74542b6af46d7b5f7470929bf9f3861ace69
        ),
      ),
    );
  }
}
