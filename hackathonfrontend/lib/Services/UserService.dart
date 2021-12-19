import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Entity/User.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class UserService {
  final String getUrl = "$localhost/user/";
  final String postUrl = "$localhost/user/insert/";
  final String updateUrl = "$localhost/user/update/";
  final String signInUrl = "$localhost/user/signin/";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<User> users = values.map((e) => User.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return users;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<String> postUser(int locationID, String name, String email, int age,
      String gender, String password) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "locationID": locationID.toString(),
        "name": name.toString(),
        "email": email.toString(),
        "age": age.toString(),
        "gender": gender.toString(),
        "password": password.toString()
      },
    );
    String values = jsonDecode(response.body);
    print(response.body);

    if (response.statusCode == 200) {
      if (values == "Email used") {
        print("user already exists");
        return "exists";
      }

      return "success";
    } else {
      return "noConnection";
    }
  }

  Future<bool> updateUser(User user) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "userID": user.userID.toString(),
        "locationID": user.locationID.toString(),
        "name": user.name.toString(),
        "email": user.email.toString(),
        "age": user.age.toString(),
        "gender": user.gender.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    final res = await http.post(
      Uri.parse(signInUrl),
      body: <String, String>{
        "email": email.toString(),
        "password": password.toString(),
      },
    );
    print(res.statusCode);
    var values = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (values == "Wrong Password") {
        return "failed";
      }
      return User.fromJson(values[0]);

    } else {
      return "noConnection";
    }
  }
}
