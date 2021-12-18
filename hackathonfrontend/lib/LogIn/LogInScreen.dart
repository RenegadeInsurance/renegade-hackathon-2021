import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Services/UserService.dart';
import 'package:hackathonfrontend/SignUp/SignUpScreen.dart';
import 'package:hackathonfrontend/WeatherForecast/WeatherForecast.dart';
import 'package:hackathonfrontend/components/texts.dart';

import '../data.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Image.asset(
                "assets/cloudy.png",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 5,
              ),
              Heading20Bold("WEAS", Colors.black),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
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
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: "email",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red)),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  visible = !visible;
                                },
                              );
                            },
                            child: Icon(
                              visible ? Icons.visibility : Icons.visibility_off,
                              color: visible
                                  ? Colors.blue
                                  : Colors.black.withOpacity(0.5),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue,
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
                          if (value != "noConnection" && value != "failed") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Successful")));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return WeatherForecast();
                            }));
                          } else if (value == "failed") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Please check your credentials")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No internet connection")));
                          }
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// Sign Up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SignUpScreen();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
