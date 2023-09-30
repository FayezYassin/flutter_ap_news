import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewscer extends StatelessWidget {
  final String url;
  WebViewscer(this.url);

  @override
  Widget build(BuildContext context) {
    print(url + 'fayez url hhhhhh');
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
