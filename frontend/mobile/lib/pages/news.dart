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
              print(snapshot.data);
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
              print(snapshot.error);
              return Text(
                snapshot.error.toString(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Future<NewsModel> getNews() async {
  var url = Uri.http('bda9-27-34-16-254.ngrok.io', '/api/news/get-news/');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var newsJson = jsonDecode(response.body);
    return newsJson;
  } else {
    throw Exception();
  }
}
