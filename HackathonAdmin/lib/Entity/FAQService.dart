import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data.dart';
import 'FAQ.dart';

class FAQService {
  final String getUrl = "$localhost/faq/";
  final String postUrl = "$localhost/faq/insert/";
  final String updateUrl = "$localhost/faq/update/";

  Future<List<FAQ>> fetchFAQs() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<FAQ> faqs = values.map((e) => FAQ.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return faqs;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<bool> postFAQ(
    int riskAssessmentID,
    double yesRiskFactor,
    double noRiskFactor,
    String question,
    int yesNode,
    int noNode,
    bool isStart,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "riskAssessmentID": riskAssessmentID.toString(),
        "yesRiskFactor": yesRiskFactor.toString(),
        "noRiskFactor": noRiskFactor.toString(),
        "question": question.toString(),
        "yesNode": yesNode.toString(),
        "noNode": noNode.toString(),
        "isStart": isStart.toString(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateFAQ(FAQ faq) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "FAQID": faq.FAQID.toString(),
        "riskAssessmentID": faq.riskAssessmentID.toString(),
        "yesRiskFactor": faq.yesRiskFactor.toString(),
        "noRiskFactor": faq.noRiskFactor.toString(),
        "question": faq.question.toString(),
        "yesNode": faq.yesNode.toString(),
        "noNode": faq.noNode.toString(),
        "isStart": faq.isStart.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
