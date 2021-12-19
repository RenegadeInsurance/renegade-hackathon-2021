import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/UserService.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/components/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data.dart';

class LogInScreen extends StatefulWidget {
  final PageController _pageController;

  const LogInScreen(this._pageController);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visible = false;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(

        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Color(0xff0B122F),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          widget._pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/cloudy.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Heading20Bold("WEAS", Colors.white),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                          ),
                          child: TextFormField(
                            controller: _username,
                            enableSuggestions: true,
                            validator: (email) {
                              RegExp emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              if (email == null || email.isEmpty) {
                                return 'Please enter your email';
                              } else if (!emailValid.hasMatch(email)) {
                                return "Please enter valid email";
                              }
                            },
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xff6DA7FE))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xff6DA7FE))),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextFormField(
                            obscureText: visible ? false : true,
                            controller: _password,
                            textAlignVertical: TextAlignVertical.center,
                            enableSuggestions: true,
                            validator: (pwd) {
                              if (pwd == null || pwd.isEmpty) {
                                return 'Please enter your password';
                              } else if (pwd.length < 8) {
                                return "Password must be atleast of 8 characters";
                              }
                            },
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xff6DA7FE))),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        visible = !visible;
                                      },
                                    );
                                  },
                                  child: Icon(
                                    visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: visible
                                        ? Colors.yellow
                                        : Colors.white.withOpacity(0.5),
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xff6DA7FE))),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff6DA7FE),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                UserService()
                                    .signIn(_username.text, _password.text)
                                    .then((value) {
                                  try {
                                    meUser = value;
                                  } catch (e) {
                                    print(e);
                                  }
                                  if (value != "noConnection" &&
                                      value != "failed") {
                                    SharedPreferences.getInstance().then((a) =>
                                        a.setInt("userID", meUser!.userID));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Login Successful")));
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return WeatherForecast();
                                    }));
                                  } else if (value == "failed") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please check your credentials")));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("No internet connection")));
                                  }
                                });
                              }
                            },
                            child: Center(
                              child: Text(
                                "Log In",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
