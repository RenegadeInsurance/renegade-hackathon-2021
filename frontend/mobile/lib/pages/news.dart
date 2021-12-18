import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/newsModels.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: FutureBuilder<NewsModel>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final news = snapshot.data;
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Text(
                        "${news?.title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${news?.creationDate}',
                  ),
                  Image.network(
                    '${news?.imageURL}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${news?.newsContent}',
                    textAlign: TextAlign.justify,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}

Future<NewsModel> getNews() async {
  final url = Uri.http('user:pass@10.0.2.2:8000', '/api/news/get-news/');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    String newsJson = jsonDecode(response.body);
    return NewsModel.fromJson(newsJson);
  } else {
    throw Exception();
  }
}
