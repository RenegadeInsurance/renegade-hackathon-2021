import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../data.dart';

class CountryService {
  final String getCountryUrl =
      "https://www.universal-tutorial.com/api/countries";
  final String getStateUrl = "https://www.universal-tutorial.com/api/states/";
  final String getCityUrl = "https://www.universal-tutorial.com/api/cities/";

  Future<List<String>> fetchCountryService() async {
    final response =
        await http.get(Uri.parse(getCountryUrl), headers: <String, String>{
      "Authorization":
          "Bearer $authKey",
      "Accept": "application/json"
    });
    List<dynamic> values;
    try {
      values = jsonDecode(response.body);
    } catch (e) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Auth Key expired")));
      print("COUNTRY AUTH KEY HAS BEEN EXPIRED");
    }

    values = jsonDecode(response.body);
    List<String> country =
        values.map((e) => e["country_name"].toString()).toList();
    if (response.statusCode == 200) {
      return country;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<List<String>> fetchStateService(suffixUrl) async {
    final response = await http
        .get(Uri.parse("$getStateUrl$suffixUrl"), headers: <String, String>{
      "Authorization":
          "Bearer $authKey",
      "Accept": "application/json"
    });
    List<dynamic> values = jsonDecode(response.body);
    List<String> states =
        values.map((e) => e["state_name"].toString()).toList();

    if (response.statusCode == 200) {
      return states;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<List<String>> fetchCityService(suffixUrl) async {
    final response = await http
        .get(Uri.parse("$getCityUrl$suffixUrl"), headers: <String, String>{
      "Authorization":
      "Bearer $authKey",
      "Accept": "application/json"
    });
    List<dynamic> values = jsonDecode(response.body);
    List<String> city = values.map((e) => e["city_name"].toString()).toList();
    print(response.body);
    print("$getStateUrl$suffixUrl");
    if (response.statusCode == 200) {
      return city;
    } else {
      throw Exception("failed to load post");
    }
  }
}
