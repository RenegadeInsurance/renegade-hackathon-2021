import 'dart:convert';

import 'package:hackathonfrontend/Entity/User.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class UserService {
  final String getUrl = "$localhost/user/";
  final String postUrl = "$localhost/user/insert/";
  final String updateUrl = "$localhost/user/update/";

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

  Future<bool> postUser(int locationID, double riskFactor, String name,
      String email, String password, int age, String gender) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "locationID": locationID.toString(),
        "riskFactor": riskFactor.toString(),
        "name": name.toString(),
        "email": email.toString(),
        "password": password.toString(),
        "age": age.toString(),
        "gender": gender.toString(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "userID": user.userID.toString(),
        "locationID": user.locationID.toString(),
        "riskFactor": user.riskFactor.toString(),
        "name": user.name.toString(),
        "email": user.email.toString(),
        "password": user.password.toString(),
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
}
