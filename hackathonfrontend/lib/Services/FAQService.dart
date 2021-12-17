import 'dart:convert';

import 'package:hackathonfrontend/Entity/FAQ.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

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
    String question,
    int yesNode,
    int noNode,
    bool isStart,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
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

  Future<bool> updateFAQ(FAQ location) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "FAQID": location.FAQID.toString(),
        "question": location.question.toString(),
        "yesNode": location.yesNode.toString(),
        "noNode": location.noNode.toString(),
        "isStart": location.isStart.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
