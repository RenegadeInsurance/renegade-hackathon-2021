import 'dart:convert';

import 'package:hackathonfrontend/Entity/Location.dart';
import 'package:hackathonfrontend/Entity/PersonalCity.dart';
import 'package:hackathonfrontend/Entity/PersonalCity.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class PersonalCityService {
  final String getUrl = "$localhost/personalcity/";
  final String postUrl = "$localhost/personalcity/insert/";
  final String updateUrl = "$localhost/personalcity/update/";

  Future<List<PersonalCity>> fetchPersonalCitys() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<PersonalCity> personalCitys =
        values.map((e) => PersonalCity.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return personalCitys;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<bool> postPersonalCity(
    int userID,
    String country,
    String state,
    String city,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "userID": userID.toString(),
        "country": country.toString(),
        "state": state.toString(),
        "city": city.toString(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePersonalCity(PersonalCity personalCity) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "personalCountriesID": personalCity.personalCountriesID.toString(),
        "userID": personalCity.userID.toString(),
        "country": personalCity.country.toString(),
        "state": personalCity.state.toString(),
        "city": personalCity.city.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
