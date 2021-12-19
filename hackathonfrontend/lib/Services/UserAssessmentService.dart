import 'dart:convert';

import 'package:hackathonfrontend/Entity/UserAssessment.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class UserAssessmentService {
  final String getUrl = "$localhost/userassessment/";
  final String postUrl = "$localhost/userassessment/insert/";
  final String updateUrl = "$localhost/userassessment/update/";

  Future<List<UserAssessment>> fetchUserAssessments() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<UserAssessment> userAssessments =
        values.map((e) => UserAssessment.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return userAssessments;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<bool> postUserAssessment(
    int userID,
    int riskAssessmentID,
    bool isTaken,
    double riskFactor,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "userID": userID.toString(),
        "riskAssessmentID": riskAssessmentID.toString(),
        "isTaken": isTaken.toString(),
        "riskFactor": riskFactor.toString(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateUserAssessment(UserAssessment userAssessment) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "userAssessmentID": userAssessment.userAssessmentID.toString(),
        "userID": userAssessment.userID.toString(),
        "riskAssessmentID": userAssessment.riskAssessmentID.toString(),
        "isTaken": userAssessment.isTaken.toString(),
        "riskFactor": userAssessment.riskFactor.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
