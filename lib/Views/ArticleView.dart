import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleVIew extends StatefulWidget {
  final url;
  const ArticleVIew({Key? key, this.url}) : super(key: key);

  @override
  _ArticleVIewState createState() => _ArticleVIewState();
}

class _ArticleVIewState extends State<ArticleVIew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
