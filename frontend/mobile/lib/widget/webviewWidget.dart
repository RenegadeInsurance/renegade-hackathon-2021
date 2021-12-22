import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
        }
        return false;
      },
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          Expanded(
            child: WebView(
              initialUrl: 'http://10.0.2.2:3000',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) => {this.controller = controller},
              onProgress: (progress) =>
                  setState(() => this.progress = progress / 100),
            ),
          ),
        ],
      ),
    );
  }
}
