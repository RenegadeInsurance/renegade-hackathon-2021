import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
              Expanded(
                child: WebView(
                  initialUrl: 'https://ec21-113-199-231-136.ngrok.io/',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) =>
                      {this.controller = controller},
                  onProgress: (progress) =>
                      setState(() => this.progress = progress / 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
