import 'dart:convert';

import 'package:hackathonfrontend/Entity/RiskAssessment.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class RiskAssessmentService {
  final String getUrl = "$localhost/riskassessment/";
  final String postUrl = "$localhost/riskassessment/insert/";
  final String updateUrl = "$localhost/riskassessment/update/";

  Future<List<RiskAssessmentEntity>> fetchRiskAssessments() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<RiskAssessmentEntity> riskAssessments =
        values.map((e) => RiskAssessmentEntity.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return riskAssessments;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<bool> postRiskAssessment(
    String title,
    String remarks,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "title": title.toString(),
        "remarks": remarks.toString(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateRiskAssessment(RiskAssessmentEntity riskAssessment) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "riskAssessmentID": riskAssessment.riskAssessmentID.toString(),
        "title": riskAssessment.title.toString(),
        "remarks": riskAssessment.remarks.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
