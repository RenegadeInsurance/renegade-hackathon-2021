import 'package:flutter/material.dart';
import 'package:hackathonfrontend/Entity/PersonalContact.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data.dart';

class PersonalContactService {
  final String getUrl = "$localhost/personalcontact/";
  final String postUrl = "$localhost/personalcontact/insert/";
  final String updateUrl = "$localhost/personalcontact/update/";

  Future<List<PersonalContact>> fetchUserAssessments() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<PersonalContact> personalContacts =
        values.map((e) => PersonalContact.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return personalContacts;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<bool> postPersonalContact(
    int personalContactID,
    String name,
    String relation,
    String email,
    int phone,
    bool isSelected,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "name": name.toString(),
        "relation": relation.toString(),
        "email": email.toString(),
        "phone": phone.toString(),
        "isSelected": isSelected.toString(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePersonalContact(PersonalContact personalContact) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "personalContactID": personalContact.personalContactID.toString(),
        "name": personalContact.name.toString(),
        "relation": personalContact.relation.toString(),
        "email": personalContact.email.toString(),
        "phone": personalContact.phone.toString(),
        "isSelected": personalContact.isSelected.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
